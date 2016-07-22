GGpurge = {
	if(!isNull(_this)) then {
		_this enableSimulation false;
		_this removeAllMPEventHandlers "mpkilled";
		_this removeAllMPEventHandlers "mphit";
		_this removeAllMPEventHandlers "mprespawn";
		_this removeAllEventHandlers "FiredNear";
		_this removeAllEventHandlers "HandleDamage";
		_this removeAllEventHandlers "Killed";
		_this removeAllEventHandlers "Fired";
		_this removeAllEventHandlers "GetOut";
		_this removeAllEventHandlers "GetIn";
		_this removeAllEventHandlers "Local";
		clearVehicleInit _this;
		deleteVehicle _this;
		deleteGroup (group _this);
		_this = nil;
	};
};

objectDelete = {
	_objectID 	= _this getVariable ['ObjectID','0'];
	_objectUID 	= _this getVariable ['ObjectUID','0'];
	if (isNil '_objectID') exitWith {
		diag_log ["GG CLEANUP: Error deleting object!"];
	};
	if (isNil '_objectUID') exitWith {
		diag_log ["GG CLEANUP: Error deleting object!"];
	};
	PVDZE_obj_Delete = [_objectID,_objectUID,player];
	publicVariableServer 'PVDZE_obj_Delete';
	if !(isNull _this) then {deleteVehicle _this};
};

if (isServer) then {
    [] spawn {
        private["_lastbikeClean","_lastLootClean","_lastZombieClean","_lastGroupClean","_lastSeagullClean","_countCleaned","_countTotal","_lootPiles","_seagulls","_zombies","_nearby","_pos","_keep","_ammobox","_lastvehiclecleanup","_lastservercleancheck"];
        waitUntil {!(isNil "sm_done");};
        diag_log text "GG CLEANUP: Initialized...";

        _lastZombieClean = diag_tickTime;
        _lastGroupClean = diag_tickTime;
        _lastSeagullClean = diag_tickTime;
		_lastvehiclecleanup = diag_tickTime;
		_lastservercleancheck = diag_tickTime;
		_lastlootClean = diag_tickTime;
		_lastbikeClean = diag_tickTime;

        while {true} do {
			
			if ((diag_tickTime - _lastbikeClean) > 180) then {
				_lastbikeClean = diag_tickTime;
				_bikes = entities 'MMT_Civ';
				_deleted = 0;
				{
					_obj = _x;
					if(!isNull _obj)then
					{
						_count = {isPlayer _x} count (_obj nearEntities 100);
						if(_count == 0)then
						{
							_deleted = _deleted + 1;deleteVehicle _obj;
						};
					};
				} forEach _bikes;
				diag_log text format["GG CLEANUP: %1 bikes were deleted.",_deleted];
			};
			
			if ((diag_tickTime - _lastlootClean) > 180) then {
			_ltQty = 0;
			_lastlootClean = diag_tickTime;
				{
					if (!isNull _x) then {
						_near = {isPlayer _x} count (_x nearentities [["CAManBase"],250]);
						_keep = _x getVariable ["permaLoot",false];
						if ((_near == 0)&&(!_keep)) then {deleteVehicle _x;_ltQty = _ltQty + 1};
					};
				} foreach ((allMissionObjects "WeaponHolder")+(allMissionObjects "WeaponHolderBase"));
				diag_log text format["GG CLEANUP: %1 loot items were deleted.",_ltQty];
			};
			
            if ((diag_tickTime - _lastZombieClean) > 180) then {
                _lastZombieClean = diag_tickTime;
                _zombies = entities "zZombie_Base";
                _countTotal = count _zombies;
                _countCleaned = 0;
                {
                    if(!(isNull _x)) then {
                        if (local _x) then {
                            _x call GGpurge;
                            _countCleaned = _countCleaned + 1;
                        } else {
                            if (!alive _x) then {
                                _pos = getPosATL _x;
                                if (count _pos > 0) then {
                                    _nearby = {(isPlayer _x) and (alive _x)} count (_pos nearEntities [["CAManBase","AllVehicles"], 130]);
                                    if (_nearby==0) then {
                                        _x call GGpurge;
                                        _countCleaned = _countCleaned + 1;
                                    };
                                };
                            };
                        };
                    };
                    sleep 0.001;
                } forEach _zombies;
                diag_log text format["GG CLEANUP: Deleted %1 Zombies out of %2",_countCleaned,_countTotal];
            };
			
			if (((diag_tickTime - _lastvehiclecleanup) > 300)) then
			{
			_lastvehiclecleanup = diag_tickTime;
			private ["_GGVC","_vehs","_garage"];
				_GGVC = 0;
				_vehs = [];
				{
					_garage = (getPosATL _x) nearObjects ["Land_sara_hasic_zbroj",7];
					if !((count _garage) > 1) then {
						if (((damage _x)>0.90)&&!(_x isKindOf "MAN")&&!(_x isKindOf "CAAnimalBase")&&!(_x isKindOf "zZombie_Base")&&!(_x isKindOf "static")&&!(_x isKindOf "building")) then {
							if (typeOf _x != "SHEEP") then {
								_x spawn objectDelete;
								_GGVC = _GGVC + 1;
								_vehs = _vehs + [typeOf _x];
							};
						};
					};
				} forEach (vehicles);
				diag_log (format["GG CLEANUP: %1 blown up vehicles were deleted: %2",_GGVC,_vehs]);
			};
			
			if (((diag_tickTime - _lastservercleancheck) > 300)) then
			{
			_lastservercleancheck = diag_tickTime;
			private ["_itemclasses","_itemlist","_itemCount"];
			_itemclasses =
				[
					"GraveCrossHelmet_EP1","GraveCrossHelmet_DZ","wreck","crater","craterlong","PartWoodPile",
					"SeaGull","Rabbit","WildBoar","Cow","Goat","Sheep","Bird","wire_cat1",
					"CAAnimalBase","Sound_Flies"
				];
				{
					_itemlist 	= allMissionObjects _x;
					_itemCount 	= (count _itemlist);
					{
						if ((typeOf _x != "DZ_fin")||(typeOf _x != "DZ_pastor")||(typeOf _x != "SHEEP")) then {
							_x spawn objectDelete;
						};
					} forEach (allMissionObjects _x);
					diag_log (format["GG CLEANUP: Deleted %1 %2(s)",_itemCount,_x]);
				} forEach _itemclasses;
			};

            if ((diag_tickTime - _lastGroupClean) > 180) then {
                _lastGroupClean = diag_tickTime;
                _countTotal = count allGroups;
                _countCleaned = 0;
                {
                    if(!(isNull _x)) then {
                        if (count units _x == 0) then {
                            deleteGroup _x;
                            _x = nil;
                            _countCleaned = _countCleaned + 1;
                        };
                    };
                    sleep 0.001;
                } forEach allGroups;
                diag_log text format["GG CLEANUP: Deleted %1 Groups out of %2",_countCleaned,_countTotal];
            };

            if ((diag_tickTime - _lastSeagullClean) > 180) then {
                _lastSeagullClean = diag_tickTime;
                _seagulls = entities "Seagull";
                _countTotal = count _seagulls;
                _countCleaned = 0;
                {
                    _x call GGpurge;
                    _countCleaned = _countCleaned + 1;
                    sleep 0.001;
                } forEach _seagulls;
                diag_log text format["GG CLEANUP: Deleted %1 Seagulls out of %2",_countCleaned,_countTotal];
            };

            sleep 1;
        };
    };
};