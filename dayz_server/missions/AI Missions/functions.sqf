diag_log text "[AI Missions]: Loading ExecVM Functions.";
HeroTimer = "\z\addons\dayz_server\missions\AI Missions\scripts\HeroTimer.sqf";
BanditTimer = "\z\addons\dayz_server\missions\AI Missions\scripts\BanditTimer.sqf";
MarkerRefresh = "\z\addons\dayz_server\missions\AI Missions\scripts\MarkerRefresh.sqf";

HeroMarker = "\z\addons\dayz_server\missions\AI Missions\scripts\HeroMarker.sqf";
BanditMarker = "\z\addons\dayz_server\missions\AI Missions\scripts\BanditMarker.sqf";

AIKilled = "\z\addons\dayz_server\missions\AI Missions\scripts\AIKilled.sqf";

BoxSetup = "\z\addons\dayz_server\missions\AI Missions\scripts\Box.sqf";
SaveVeh = "\z\addons\dayz_server\missions\AI Missions\scripts\SaveToHive.sqf";

diag_log text "[AI Missions]: Loading Compiled Functions.";
AISpawn = compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\AI Missions\scripts\AISpawn.sqf";

diag_log text "[AI Missions]: Loading All Other Functions.";
AIMissionFindPos = {
    private["_mapHardCenter","_mapRadii","_isTavi","_centerPos","_pos","_disCorner","_hardX","_hardY","_findRun","_posX","_posY","_feel1","_feel2","_feel3","_feel4","_noWater","_tavTest","_tavHeight","_disMaj","_disMin","_okDis","_isBlack"];
	_mapHardCenter = true;
	_mapRadii = 5500;
	_isTavi = false;
	_tavHeight = 0;
	switch (AIMissionWorldName) do {
		case "chernarus":{_centerPos = [7100, 7750, 0];_mapRadii = 5500;};
		case "utes":{_centerPos = [3500, 3500, 0];_mapRadii = 3500;};
		case "zargabad":{_centerPos = [4096, 4096, 0];_mapRadii = 4096;};
		case "fallujah":{_centerPos = [3500, 3500, 0];_mapRadii = 3500;};
		case "takistan":{_centerPos = [5500, 6500, 0];_mapRadii = 5000;};
		case "tavi":{_centerPos = [10370, 11510, 0];_mapRadii = 14090;_isTavi = true;};
		case "lingor":{_centerPos = [4400, 4400, 0];_mapRadii = 4400;};
		case "namalsk":{_centerPos = [4352, 7348, 0]};
		case "napf":{_centerPos = [10240, 10240, 0];_mapRadii = 10240;};
		case "mbg_celle2":{_centerPos = [8765.27, 2075.58, 0]};
		case "oring":{_centerPos = [1577, 3429, 0]};
		case "panthera2":{_centerPos = [4400, 4400, 0];_mapRadii = 4400;};
		case "isladuala":{_centerPos = [4400, 4400, 0];_mapRadii = 4400;};
		case "smd_sahrani_a2":{_centerPos = [13200, 8850, 0]};
		case "sauerland":{_centerPos = [12800, 12800, 0];_mapRadii = 12800;};
		case "trinity":{_centerPos = [6400, 6400, 0];_mapRadii = 6400;};
		default{_pos = [getMarkerPos "center",0,5500,60,0,20,0] call BIS_fnc_findSafePos;_mapHardCenter = false;};
	};
    if (_mapHardCenter AND (!(StaticPlc))) then {
        _hardX = _centerPos select 0;
        _hardY = _centerPos select 1;
        _findRun = true;
        while {_findRun} do
        {
            _pos = [_centerPos,0,_mapRadii,60,0,20,0] call BIS_fnc_findSafePos;
            _posX = _pos select 0;
            _posY = _pos select 1;
            _feel1 = [_posX, _posY+50, 0];
            _feel2 = [_posX+50, _posY, 0];
            _feel3 = [_posX, _posY-50, 0];
            _feel4 = [_posX-50, _posY, 0];
            _noWater = (!surfaceIsWater _pos && !surfaceIsWater _feel1 && !surfaceIsWater _feel2 && !surfaceIsWater _feel3 && !surfaceIsWater _feel4);
			if (_isTavi) then {
				_tavTest = createVehicle ["Can_Small",[_posX,_posY,0],[], 0, "CAN_COLLIDE"];
				_tavHeight = (getPosASL _tavTest) select 2;
				deleteVehicle _tavTest;
			};
			_disHero = (_pos distance HeroCoords);
			_disBandit = (_pos distance BanditCoords);
			_okDis = ((_disHero > 1000) AND (_disBandit > 1000));
            _isBlack = false;
            {
                if ((_pos distance (_x select 0)) <= (_x select 1)) then {_isBlack = true;};
            } forEach BlacklistZones;
            if ((_posX != _hardX) AND (_posY != _hardY) AND _noWater AND _okDis AND !_isBlack) then {
				if (!(_isTavi)) then {
					_findRun = false;
				};
				if (_isTavi AND (_tavHeight <= 185)) then {
					_findRun = false;
				};
            };
            sleep 2;
        };
    };
	if (StaticPlc) then {
		_pos = AIMissionStatLocs call BIS_fnc_selectRandom;
	};
    _fin = [(_pos select 0), (_pos select 1), 0];
    _fin
};

SetupVehicle = {
	private ["_object","_objectID","_ranFuel"];
	_object = _this select 0;
	_objectID = str(round(random 999999));
	_object setVariable ["ObjectID", _objectID, true];
	_object setVariable ["ObjectUID", _objectID, true];
	if (Epoch) then {
		PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];
	} else {
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
	};
	waitUntil {(!isNull _object)};
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	_ranFuel = random 1;
	if (_ranFuel < .1) then {_ranFuel = .1;};
	_object setFuel _ranFuel;
	_object setvelocity [0,0,1];
	_object setDir (round(random 360));
	if (!(SaveVehicles)) then {
		_object addEventHandler ["GetIn",{
			_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
		}];
	};
	true
};

ProtectObj = {
	private ["_object","_objectID"];
	_object = _this select 0;
	_objectID = str(round(random 999999));
	_object setVariable ["ObjectID", _objectID, true];
	_object setVariable ["ObjectUID", _objectID, true];
	if (_object isKindOf "ReammoBox") then {
		_object setVariable ["permaLoot",true];
	};
	if (Epoch) then {
		PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];
	} else {
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
	};
    if (!((typeOf _object) in ["USVehicleBox","USLaunchersBox","AmmoBoxSmall_556","AmmoBoxSmall_762","MedBox0","USBasicWeaponsBox","USBasicAmmunitionBox","RULaunchersBox"]) || SceneryDespawnLoot) then {
        _object setVariable["AIMissionCleanup",true];
    };
	true
};

GetWeapon = {
	private ["_skill","_aiweapon","_weapon","_magazine","_fin"];
	_skill = _this select 0;
	switch (_skill) do {
		case 0: {_aiweapon = Weps0;};
		case 1: {_aiweapon = Weps1;};
		case 2: {_aiweapon = Weps2;};
		case 3: {_aiweapon = Weps3;};
	};
	_weapon = _aiweapon call BIS_fnc_selectRandom;
	_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
	_fin = [_weapon,_magazine];
	_fin
};
GetVeh = {
	private ["_type","_vehArray","_choseVic"];
	_type = _this select 0;
	switch (_type) do {
		case "heli": {_vehArray = AIAirVehicles;};
		case "small": {_vehArray = AIArmedVehicles;};
		case "large": {_vehArray = AICargoVehicles;};
	};
	_choseVic = _vehArray call BIS_fnc_selectRandom;
	_choseVic
};

WaitMissionComp = {
    private["_objective","_unitArrayName","_numSpawned","_numKillReq"];
    _objective = _this select 0;
    _unitArrayName = _this select 1;
    call compile format["_numSpawned = count %1;",_unitArrayName];
    _numKillReq = ceil(RequiredKillPercent * _numSpawned);
    diag_log text format["[AI Missions]: (%3) Waiting for %1/%2 Units or Less to be Alive and a Player to be Near the Objective.",(_numSpawned - _numKillReq),_numSpawned,_unitArrayName];
    call compile format["waitUntil{sleep 1; ({isPlayer _x && _x distance _objective <= 30} count playableUnits > 0) && ({alive _x} count %1 <= (_numSpawned - _numKillReq));};",_unitArrayName];
    if (SceneryDespawnTimer > 0) then {_objective spawn CleanupThread;};
};

AIMissionSleep = {
    private["_sleepTime","_checkInterval","_startTime"];
    _sleepTime = _this select 0;
    _checkInterval = _this select 1;
    _startTime = diag_tickTime;
    waitUntil{sleep _checkInterval; (diag_tickTime - _startTime) > _sleepTime;};
};

AIMissionPurge = {
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

CleanupThread = {
    [SceneryDespawnTimer,20] call AIMissionSleep;
    {
        if (_x getVariable ["AIMissionCleanup",false]) then {
            _x call AIMissionPurge;
        };
    } forEach (_this nearObjects 50);
};

diag_log text format ["[AI Missions]: Mission Functions Script Loaded!"];
