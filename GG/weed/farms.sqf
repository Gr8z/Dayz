	

    /*
            Script by HALV
            Create Weed fields (or other objects) in random locations, amount and "random preset" amount of objects,
            objects are placed "Labyrinth Style" around the middle object
    */
     
    _useLocalMarkers = false;
     
    if (isServer)then{
            private["_blacklistedAreas"];
            diag_log "[Random_Weed_Farm]: waiting for BIS_fnc_findSafePos";
            waitUntil {(!isNil "BIS_fnc_findSafePos")};
            if(isNil "dayz_MapArea")then{dayz_MapArea = 7000};
            _WorldName = toLower format ["%1", worldName];
     
    //settings
            //how many will spawn farms, note that farms can spawn "on top" of eachother (min 1, default 6)
            _farms = 6;
            //min farms (min 1, default 2)
            _farmsmin = 5;
            //how many plants per farm (min 1, default 9)
            _plants = 10;
            //min plants (min 1, default 4)
            _plantsmin = 9;
            //min dist (in meters) from roads to build farms (default 200m)
            _mindist2roads = 50;
            //the object to spawn, default "Fiberplant"
            _fiberplant = "Fiberplant";
            _spawnarea = (dayz_MapArea/2);
            switch(_WorldName)do{
                    case "tavi":{
					_blacklistedAreas = [
					[[11698.81,15210.1210,0],500,true], // Lyepestok
					[[15309.663,9278.4912,0],400,true], // Sabina
					[[5538.7354,8762.2695,0],500,true], // Bilgrad
					[[7376.6084,4296.5879,0],600,true], // Branibor
					[[10948.426,654.90265,0],1000,true], // Bandit
					[[15587.822,16394.049,0],400,true], // Hero
					[[16555.732,10159.68,0],1000,true],  // Aircraft 1
					[[6815.0776,8534.1504,0],1000,true], // Aircraft 2
					[[4066.3528,7265.0024,0],500,true], // Misc 1
					[[17497.631,7159.0879,0],500,true], // Misc 2 
					[[17332.115,12930.239,0],500,true], // Boat 1
					[[10570.494,16772.477,0],500,true], // Boat 2
					[[10698.463,5983.665,0],500,true],  // Boat 3
					[[5419.2437,9503.5479,0],500,true], // Boat 4
					[[13342.758,8611.9932,0],200,true], // Wholesaler 1
					[[9859.4209,7471.5684,0],200,true], // Wholesaler 2
					[[9761,14220,0],10,true]			 // spawn
                    ];
                    };
                    case "chernarus":{
                    _blacklistedAreas = [
                    [[23999.742,2.4571743,0],       500],
                    [[6325.6772,7807.7412,0],       500],
                    [[4063.4226,11664.19,0],        500],
                    [[11447.472,11364.504,0],       500],
                    [[1606.6443,7803.5156,0],       500],
                    [[12944.227,12766.889,0],       500],
                    [[8122.35,13464.5,0],           500] // <-- no comma for last entry
                    ];
                    };
                    default{
                    _blacklistedAreas = [
                            [[0,0,0],       0]
                    ];
                    };
            };
    //function to find x amount of positions around a position (on ground, z axis not included) in a size you define - "labyrinth style"
    //[start position, amount of positions to return (ex start pos), distance between positions,include startposition (optional, default true)] call _fnc_positions_array
            _fnc_positions_array = {
                    private ["_posi"];
                    _pos = _this select 0;
                    _amnt = _this select 1;
                    _adjust = _this select 2;
                    _include = if(count _this > 3)then{_this select 3}else{true};
                    _positions = [];
                    _buildDir = 0;
                    _buildRow = 0;
                    _Row = 0;
                    _build = 0;
                    if(_include)then{_positions set [count _positions,[_pos select 0,_pos select 1,0]];_amnt = _amnt - 1;};
                    for "_i" from 0 to (_amnt-1) do {
                            if(_Row > 1)then{_buildRow = _buildRow + 1;_Row = 0;};
                            if(_buildDir > 3)then{_buildDir = 0;};
                            for "_i" from 0 to _buildRow do {
                                    switch (_buildDir) do{
                                            case 0:{
                                                    _posi = [(_pos select 0),(_pos select 1) + _adjust]; //up
                                                    _positions set [count _positions,[_posi select 0,_posi select 1,0]];
                                            };
                                            case 1:{
                                                    _posi = [(_pos select 0) + _adjust,(_pos select 1)]; //left
                                                    _positions set [count _positions,[_posi select 0,_posi select 1,0]];
                                            };
                                            case 2:{
                                                    _posi = [(_pos select 0),(_pos select 1) - _adjust]; //down
                                                    _positions set [count _positions,[_posi select 0,_posi select 1,0]];
                                            };
                                            case 3:{
                                                    _posi = [(_pos select 0) - _adjust,(_pos select 1)]; //right
                                                    _positions set [count _positions,[_posi select 0,_posi select 1,0]];
                                            };
                                    };
                                    _pos = _posi;
                                    _build = _build + 1;
                                    if(_build >= _amnt)exitWith{};
                            };
                            _buildDir = _buildDir + 1;
                            _Row = _Row + 1;
                            if(_build >= _amnt)exitWith{};
                    };
    //              diag_log format["[Random_Weed_Farm]: Debug - _build: '%1' _amnt: '%2' _positions: '%3' %4",_build,_amnt,(count _positions),_positions];
                    _positions
            };
     
            _amnt = round(random _farms);
            if(_amnt < _farmsmin)then{_amnt = _farmsmin};
            if(_amnt < 1)then{_amnt = 1};
     
            diag_log format["[Random_Weed_Farm]: Function loaded ... Server Building %1 Weed Farm(s)",_amnt];
     
            _locations = [];
            for "_i" from 0 to (_amnt-1) do {
                    private ["_coords"];
                    while{true}do{
                            scopeName "posiscope";
                            _coords = [getMarkerPos 'Center',0,_spawnarea,25,0,2000,0] call BIS_fnc_findSafePos;
                            _roadlist = _coords nearRoads _mindist2roads;
                            _IsBlacklisted = false;
                            {if(_coords distance (_x select 0) < (_x select 1))exitWith{_IsBlacklisted = true};}forEach _blacklistedAreas;
                            if((count _roadlist < 1) and !_IsBlacklisted)then{breakOut "posiscope"};
                    };
                    _locations set [count _locations,[_coords select 0,_coords select 1,0]];
                    _amnt = round(random _plants);
                    if(_amnt < _plantsmin)then{_amnt = _plantsmin};
                    if(_amnt < 1)then{_amnt = 1};
                    diag_log format["[Random_Weed_Farm]: Found Location for a farm (%1) %2 with %3 plants",mapGridPosition _coords,_coords,_amnt];
                    //aparently sizeOf has problems sometimes, so we iput this manually - else perhaps use [position, amount, sizeOf "object"]
                    _plantpositions = [[(_coords select 0),(_coords select 1),0],_amnt,5] call _fnc_positions_array;
                    {
                            _plant = createVehicle [_fiberplant, _x, [], 0, "CAN_COLLIDE"];
                            _plant setPos _x;
                            _uID = str(round(random 999999));
                            _plant setVariable ["ObjectID", _uID, true];
                            _plant setVariable ["ObjectUID", _uID, true];
                            _plant setVariable ["lastUpdate",time,true];
                    }forEach _plantpositions;
            };
            diag_log "[Random_Weed_Farm]: Weed Farm(s) Done ... Broadcasting locations for clients";
            PV_HALV_Broadcast_weedlocations = _locations;
            publicVariable "PV_HALV_Broadcast_weedlocations";
    };
     
    //comment out for no markers
    if(!isDedicated)then{
            diag_log "[Random_Weed_Farm]: Client awaiting markers ...";
            waitUntil{(!isNil "PV_HALV_Broadcast_weedlocations")};
            //create markers
            _nr = 1;
            for "_i" from 0 to ((count PV_HALV_Broadcast_weedlocations)-1) do {
                    _markername = format["WeedFarm_%1",_nr];
                    _markertext = format["Weed Farm %1",_nr];
                    if(_useLocalMarkers)then{
                            _marker = createMarkerLocal [_markername, (PV_HALV_Broadcast_weedlocations select _i)];
                            _marker setMarkerTypeLocal "mil_dot";
                            _marker setMarkerTextLocal _markertext;
                            _marker setMarkerColorLocal "ColorGreen";
                    }else{
                            if (getMarkerColor _markername == "") then {
                                    _marker = createMarker [_markername, (PV_HALV_Broadcast_weedlocations select _i)];
                                    _marker setMarkerType "mil_dot";
                                    _marker setMarkerText _markertext;
                                    _marker setMarkerColor "ColorGreen";
                            };
                    };
                    diag_log format["[Random_Weed_Farm]: Client created marker %1 ...",_nr];
                    _nr = _nr + 1;
            };
            PV_HALV_Broadcast_weedlocations = nil;
    };

