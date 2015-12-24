diag_log ("---------- WAI ----------");
diag_log ("Missions Starting...");
diag_log ("---------- WAI ----------");

group_waypoints = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\group_waypoints.sqf";
heli_patrol = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\heli_patrol.sqf";
vehicle_monitor = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\vehicle_monitor.sqf";
dynamic_crate = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\dynamic_crate.sqf";
spawn_ammo_box = compile preProcessFileLineNUmbers "\GG_HC\WAI\compile\ammobox.sqf";
custom_publish = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\custom_publish_vehicle.sqf";
minefield = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\minefield.sqf";

find_position = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\find_position.sqf";
mission_init = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\mission_init.sqf";
mission_winorfail = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\mission_winorfail.sqf";
heli_para = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\heli_para.sqf";
on_kill = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\on_kill.sqf";
spawn_group = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\spawn_group.sqf";
spawn_static = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\spawn_static.sqf";
vehicle_patrol = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\1\vehicle_patrol.sqf";

find_position2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\find_position.sqf";
mission_init2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\mission_init.sqf";
mission_winorfail2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\mission_winorfail.sqf";
heli_para2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\heli_para.sqf";
on_kill2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\on_kill.sqf";
spawn_group2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\spawn_group.sqf";
spawn_static2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\spawn_static.sqf";
vehicle_patrol2 = compile preprocessFileLineNumbers "\GG_HC\WAI\compile\2\vehicle_patrol.sqf";


BIS_fnc_locations = {
	if (!false) then {debuglog ('Log: [Functions] BIS_fnc_locations loaded (ca\modules\functions\systems\fn_locations.sqf)')};
	BIS_fnc_locations = compile preprocessFileLineNumbers 'ca\modules\functions\systems\fn_locations.sqf';
	_this call BIS_fnc_locations;
};
BIS_fnc_selectRandom = {
	private "_ret";
	if(count _this > 0) then {
		_ret = floor(random(count _this));
		_ret = _this select _ret;           
	};
	_ret;
};
BIS_fnc_isPosBlacklisted = {
	private ["_pos", "_list", "_x", "_y", "_listed"];
	_pos = _this select 0;
	_list = _this select 1;
	_x = _pos select 0;
	_y = _pos select 1;
	_listed = false;
	for "_i" from 0 to ((count _list) - 1) do {
		_current = (_list select _i);
		switch (typename _current) do {
			case (typeName []): {
				private ["_tl", "_br"];
				_tl = _current select 0;
				_br = _current select 1;
				private ["_minX", "_maxX", "_minY", "_maxY"];
				_minX = _tl select 0;
				_maxX = _br select 0;
				_minY = _br select 1;
				_maxY = _tl select 1;
				if ((_x > _minX) && (_x < _maxX) && (_y > _minY) && (_y < _maxY)) exitWith {_listed = true};
			};
			case (typeName objNull): {
				if ([_current,_pos] call BIS_fnc_inTrigger) exitwith {_listed = true};
			};
			default {
				debuglog "Log: Error in isPosBlacklisted.sqf - wrong input data.";
			};
		};
	};
	_listed
};
bis_fnc_findSafePos = {
	scopeName "main";
	private ["_pos", "_minDist", "_maxDist", "_objDist", "_waterMode", "_maxGradient", "_shoreMode", "_defaultPos", "_blacklist"];
	_pos = _this select 0;
	_minDist = _this select 1;
	_maxDist = _this select 2;
	_objDist = _this select 3;
	_waterMode = _this select 4;
	_maxGradient = _this select 5;
	_shoreMode = _this select 6;
	if (_shoreMode == 0) then {_shoreMode = false} else {_shoreMode = true};
	_blacklist = [];
	if ((count _this) > 7) then {_blacklist = _this select 7};
	_defaultPos = [];
	if ((count _this) > 8) then {_defaultPos = _this select 8};
	if ((count _pos) == 0) then {_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");};
	if ((count _pos) == 0) exitWith {debugLog "Log: [findSafePos] No center position was passed!"; []};
	if (_maxDist == -1) then {_maxDist = getNumber(configFile >> "CfgWorlds" >> worldName >> "safePositionRadius")};
	private ["_newPos", "_posX", "_posY"];
	_newPos = [];
	_posX = _pos select 0;
	_posY = _pos select 1;
	private ["_attempts"];
	_attempts = 0;
	while {_attempts < 1000} do
	{
		private ["_newX", "_newY", "_testPos"];
		_newX = _posX + (_maxDist - (random (_maxDist * 2)));
		_newY = _posY + (_maxDist - (random (_maxDist * 2)));
		_testPos = [_newX, _newY];
		if (!([_testPos, _blacklist] call BIS_fnc_isPosBlacklisted)) then {
				if ((_pos distance _testPos) >= _minDist) then {
					if (!((count (_testPos isFlatEmpty [_objDist, 0, _maxGradient, _objDist max 5, _waterMode, _shoreMode, objNull])) == 0)) then  {
						_newPos = _testPos;
						breakTo "main";
					};
				};
		};
		_attempts = _attempts + 1;
	};
	if ((count _newPos) == 0) then {
		if (_waterMode == 0) then {
			if ((count _defaultPos) > 0) then  {
				_newPos = _defaultPos select 0;
			} else {
				_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "Armory" >> "positionStart");
			};
		} else {
			if ((count _defaultPos) > 1) then {
				_newPos = _defaultPos select 1;
			} else {
				_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "Armory" >> "positionStartWater");
			};
		};
	};

	if ((count _newPos) == 0) then {
		_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	};

	_newPos
};
isNearWater = {
	private["_result","_position","_radius"];
	_result = false;
	_position = _this select 0;
	_radius		= _this select 1;
	for "_i" from 0 to 359 step 45 do {
		_position = [(_position select 0) + (sin(_i)*_radius), (_position select 1) + (cos(_i)*_radius)];
		if (surfaceIsWater _position) exitWith {_result = true};
	};
	_result
};
isNearTown = {
	private["_result","_position","_radius","_locations"];
	_result = false;
	_position = _this select 0;
	_radius = _this select 1;
	_locations = [["NameCityCapital","NameCity","NameVillage"],[_position,_radius]] call BIS_fnc_locations;
	if (count _locations > 0) then {_result = true};
	_result
};
isNearRoad = {
	private["_result","_position","_radius","_roads"];
	_result = false;
	_position = _this select 0;
	_radius = _this select 1;
	_roads = _position nearRoads _radius;
	if (count _roads > 0) then {_result = true};
	_result
};
isSlope = {
	private["_pos","_result","_position","_posx","_posy","_radius","_gradient","_max","_min","_posx","_posy"];
	_result = false;
	_position = _this select 0;
	_posx 		= _position select 0;
	_posy 		= _position select 1;
	_radius = _this select 1;
	_gradient = _this select 2;
	_max 		= getTerrainHeightASL [_posx,_posy];
	_min 		= getTerrainHeightASL [_posx,_posy];
	for "_i" from 0 to 359 step 45 do {
		_pos = [_posx + (sin(_i)*_radius), _posy + (cos(_i)*_radius)];
		_min = _min min getTerrainHeightASL _pos;
		_max = _max max getTerrainHeightASL _pos;
	};
	_result = ((_max - _min) > _gradient);
	_result
};
inDebug = {
	private["_result","_position","_hasdebug","_xLeft","_xRight","_yTop","_yBottom"];
	_result 		= false;
	_position 		= _this;
	_hasdebug 		= false;
	_xLeft = 0;
	_xRight 		= 0;
	_yTop = 0;
	_yBottom 		= 0;
	if (worldName == "Chernarus") then {
		_hasdebug = true;
		_xLeft = 1000;
		_xRight = 13350;
		_yTop = 13350;
		_yBottom = 1000;
	};
	if (_hasdebug) then {if ((_position select 0 < _xLeft)||(_position select 0 > _xRight)||(_position select 1 > _yTop)||(_position select 1 < _yBottom)) exitWith {_result = true}};
	_result
};
find_suitable_ammunition = {
	private["_weapon","_result","_ammoArray"];
	_result = false;
	_weapon = _this;
	_ammoArray = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
	if (count _ammoArray > 0) then {
		_result = switch (_ammoArray select 0) do {
			default {_ammoArray select 0};
			case "20Rnd_556x45_Stanag": {"30Rnd_556x45_Stanag"};
			case "30Rnd_556x45_G36": 	{"30Rnd_556x45_Stanag"};
			case "30Rnd_556x45_G36SD": 	{"30Rnd_556x45_StanagSD"};
		};
	};
	_result
};

createCenter EAST;
createCenter RESISTANCE;
WEST setFriend [EAST,0];
WEST setFriend [RESISTANCE,0];
EAST setFriend [WEST,0];
EAST setFriend [RESISTANCE,0];
RESISTANCE setFriend [EAST,0];
RESISTANCE setFriend [WEST,0];

ai_ground_units = 0;
ai_emplacement_units	= 0;
ai_air_units = 0;
ai_vehicle_units		= 0;

call compile preprocessFile "\GG_HC\WAI\config.sqf";
diag_log "WAI: AI Config File Loaded";
call compile preprocessFile "\GG_HC\WAI\static.sqf";

diag_log "WAI: Initialising missions";
[] spawn {
	{wai_mission_markers set [count wai_mission_markers, _x]} count ["MainHero","MainBandit","Special"];
	markerready 		= true;
	wai_mission_data	= [];
	wai_mission_sel		= [];
	wai_bandit_mission	= [];
	wai_special_mission	= [];
	h_missionrunning	= false;
	_startTime 			= ceil(time);
	_missionDelay		= 180;
	_mission 			= "";
	_result	 			= 0;

	{for "_i" from 1 to (_x select 1) do {wai_mission_sel set [count wai_mission_sel, _x select 0]}} count wai_missions;

	diag_log ("WAI: Starting mission loop 1... Timer:"+str wai_mission_timer);
	while {true} do {
		_allPlayers = playableUnits;
		_cnt 		= count _allPlayers;
		_currTime = ceil(time);
		if (isNil "_missionDelay") then {_missionDelay = ((wai_mission_timer select 0) + random((wai_mission_timer select 1) - (wai_mission_timer select 0)))};
		if ((_currTime - _startTime >= _missionDelay) && (!h_missionrunning)) then {_result = 1};
		if (h_missionrunning) then {_startTime = ceil(time)};
		if ((_cnt >= wai_players_online) && (markerready) && ((diag_fps) >= wai_server_fps)) then {
			if (_result == 1) then {
				h_missionrunning = true;
				_startTime 		= ceil(time);
				_missionDelay		= nil;
				_result = 0;
				_mission = wai_mission_sel call BIS_fnc_selectRandom;
				execVM format ["\GG_HC\WAI\missions\1\%1.sqf",_mission];
			};
		};
		uiSleep 0.1;
	};
};
[] spawn {
	{wai_mission_markers set [count wai_mission_markers, _x]} count ["MainHero","MainBandit","Special"];
	markerready2 			= true;
	wai_mission_data2		= [];
	wai_mission_sel2		= [];
	wai_bandit_mission2		= [];
	wai_special_mission2 	= [];
	h_missionrunning2		= false;
	_startTime 				= ceil(time);
	_missionDelay			= 180;
	_mission 				= "";
	_result	 				= 0;

	{for "_i" from 1 to (_x select 1) do {wai_mission_sel2 set [count wai_mission_sel2, _x select 0]}} count wai_missions2;

	diag_log ("WAI: Starting mission loop 2... Timer:"+str wai_mission_timer);
	while {true} do {
		_allPlayers = playableUnits;
		_cnt 		= count _allPlayers;
		_currTime = ceil(time);
		if (isNil "_missionDelay") then {_missionDelay = ((wai_mission_timer select 0) + random((wai_mission_timer select 1) - (wai_mission_timer select 0)))};
		if ((_currTime - _startTime >= _missionDelay) && (!h_missionrunning2)) then {_result = 1};
		if (h_missionrunning2) then {_startTime = ceil(time)};
		if ((_cnt >= wai_players_online) && (markerready2) && ((diag_fps) >= wai_server_fps)) then {
			if (_result == 1) then {
				h_missionrunning2 = true;
				_startTime 		= ceil(time);
				_missionDelay		= nil;
				_result = 0;
				_mission = wai_mission_sel2 call BIS_fnc_selectRandom;
				execVM format ["\GG_HC\WAI\missions\2\%1.sqf",_mission];
			};
		};
		uiSleep 0.1;
	};
};
[] spawn {
	diag_log "WAI: Starting performance monitor loop...";
	while {true} do {
		diag_log ("Total ground units: "+str ai_ground_units);
		diag_log ("Total air units: "+str ai_air_units);
		diag_log ("Total vehicle units: "+str ai_vehicle_units);
		diag_log ("Total emplacement units: "+str ai_emplacement_units);
		diag_log ("Current simulation FPS: "+str diag_fps);
		uiSleep 30;
	};
};