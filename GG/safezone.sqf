don_incar = 0;
don_firedEH_1 = nil;
don_godon_1 = 0;
inSafeZone = false;
[] spawn {
	private ["_runOneTime","_canbuild","_don_passengers","_don_veh_crew","_don_player_veh","_don_veh_driver"];
	waitUntil {!(isNil "canbuild")};
	_runOneTime = false;
	_canbuild = canbuild;
	while {true} do {
		waitUntil {!((_canbuild && canbuild) || (!_canbuild && !canbuild)) || !_runOneTime};
		_canbuild = canbuild;
		if (!canbuild) then {
			player_zombieCheck = {};
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			player allowDamage false;
			player removeAllEventHandlers "handleDamage"; don_godon_1 = 1; inSafeZone = true; sleep 0.025;
			[] spawn {
				private ["_myHdEh"];
				while {!inSafeZone} do {
					_myHdEh = player addEventHandler ["handleDamage", {0}];
					uiSleep 0.02;
					player removeEventHandler ["handleDamage",_myHdEh];
				};
			};
			if (isNil "don_firedEH_1") then {
				don_firedEH_1 = 0; sleep 0.025;
				don_firedEH_1 = player addEventHandler ["Fired",{
					cutText ["YOU CANNOT FIRE YOUR WEAPON","PLAIN DOWN", 2];
					deleteVehicle (_this select 6);
				}];
			};
		};
		if (canbuild && _runOneTime) then {
			[] spawn {
				for "_x" from 1 to 30 do {
					if (_x >= 6) then {cutText [format ["WEP ON AND GOD OFF IN %1", 31-_x], "PLAIN DOWN"];};
					sleep 1;
					if (!canbuild) exitWith {};
					if (_x == 30) then {
						cutText ["WEAPONS ACTIVATED AND GOD OFF", "PLAIN DOWN"];
						player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
						fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
						fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
						player allowDamage true;
						player removeAllEventHandlers "handleDamage";
						player addEventHandler ["handleDamage", {_this call fnc_usec_damageHandler;}];
						player removeEventHandler ["Fired", don_firedEH_1]; don_firedEH_1 = nil;
						don_godon_1 = 0; inSafeZone = false;
					};
				};
			};
		};
		if (!canbuild && don_incar == 1) then {
			_don_player_veh = don_player_veh; don_veh_crew = crew _don_player_veh; _don_veh_driver = driver _don_player_veh;
			_don_player_veh allowDamage false;
			_don_player_veh removeAllEventHandlers "handleDamage";
			_don_player_veh addEventHandler ["handleDamage", {0}];
			_don_player_veh removeAllEventHandlers "Fired";
			_don_player_veh addEventHandler ["Fired",{deleteVehicle (_this select 6);}];			
			//PASSENGERS NAMES
			_don_passengers = ""; {if (Alive _x) then {_don_passengers = _don_passengers + format [" %1",name _x];};} forEach don_veh_crew;
			_don_veh_crew = []; {if (Alive _x) then {_don_veh_crew = _don_veh_crew + [getPlayerUID _x];};} forEach don_veh_crew;
			//ASSING OWNERS
			if (player == _don_veh_driver) then {
				_don_player_veh setVariable ["don_ownerity_code", format ["%1_%2", getPlayerUID player, round diag_tickTime], true];
				_don_player_veh setVariable ["don_crew", _don_veh_crew, true]; //CHANGE
				_don_player_veh setVariable ["don_passengers", _don_passengers, true];
			};
		};
		if (canbuild && don_incar == 1) then {
			_don_player_veh = don_player_veh; _don_veh_driver = driver _don_player_veh;			
			[_don_player_veh] spawn {
				for "_x" from 1 to 15 do {
					sleep 1;
					if (!canbuild) exitWith {};
					if (_x == 15) then {
						(_this select 0) allowDamage true;
						(_this select 0) removeAllEventHandlers "handleDamage";
						(_this select 0) addEventHandler ["handleDamage", {_this call vehicle_handleDamage;}];
						(_this select 0) removeAllEventHandlers "Fired";
					};
				};	
			};
			//DISASSING OWNERS
			if (player == _don_veh_driver) then {
				_don_player_veh setVariable ["don_ownerity_code", nil, true];
				_don_player_veh setVariable ["don_crew", nil, true];
				_don_player_veh setVariable ["don_passengers", nil, true];
			};
		};
		_runOneTime = true;
	};
};
[] spawn {
	private ["_don_veh_crew","_wait_time","_last_mark","_max_time"];
	while {true} do {
		_max_time = 480;
		waitUntil {sleep 0.0625; vehicle player != player};
		don_player_veh = vehicle player;
		don_incar = 1;
		if (!canbuild) then {
			//VEHICLE OWNERITY CHECK
			_don_veh_crew = don_player_veh getVariable ["don_crew", nil]; if (isNil "_don_veh_crew") then {_don_veh_crew = [getPlayerUID player];};
			if !(getPlayerUID player in _don_veh_crew) then {
				call compile format ['if (isNil "don_%1") then {don_%1 = diag_tickTime;}; _last_mark = don_%1;', don_player_veh getVariable ["don_ownerity_code", 0]];
				_wait_time = diag_tickTime - _last_mark;
				if (_wait_time < _max_time) then {
					player action ["getOut", don_player_veh];
					[objNull, player, rSAY, "error1"] call RE;
					cuttext [format ["Owners:%1. %2 seconds to liberate.", don_player_veh getVariable ["don_passengers","Owners not found"], round (_max_time - _wait_time)], "PLAIN DOWN"];
					cad_pvar_smessage = [format ["%1 is messing with your vehicle! %2 seconds to liberate!", name player, round (_max_time - _wait_time)], _don_veh_crew];
					publicVariable "cad_pvar_smessage";
				} else {
					call compile format ['don_%1 = nil;', don_player_veh getVariable ["don_ownerity_code", 0]];
					//DISASSING OWNERS
					don_player_veh setVariable ["don_ownerity_code", nil, true];
					don_player_veh setVariable ["don_crew", nil, true];
					don_player_veh setVariable ["don_passengers", nil, true];
					cuttext [format ["Vehicle is now free for all!"], "PLAIN DOWN"];
					cad_pvar_smessage = [format ["One of your safe vehicle is now free and player %1 is in it!", name player], _don_veh_crew];
					publicVariable "cad_pvar_smessage";
				};
			};
			don_player_veh allowDamage false;
			don_player_veh removeAllEventHandlers "handleDamage";
			don_player_veh addEventHandler ["handleDamage", {0}];
			don_player_veh removeAllEventHandlers "Fired";
			don_player_veh addEventHandler ["Fired",{deleteVehicle (_this select 6);}];
		};
		if (canbuild) then {
			don_player_veh allowDamage true;
			don_player_veh removeAllEventHandlers "handleDamage";
			don_player_veh addEventHandler ["handleDamage", {_this call vehicle_handleDamage;}];
			don_player_veh removeAllEventHandlers "Fired";
			//DISASSING OWNERS
			if (player == driver don_player_veh) then {
				don_player_veh setVariable ["don_ownerity_code", nil, true];
				don_player_veh setVariable ["don_crew", nil, true];
				don_player_veh setVariable ["don_passengers", nil, true];
			};
		};
		waitUntil {sleep 0.0625; vehicle player == player};
		don_incar = 0;
		don_player_veh = nil;
	};
};

"cad_pvar_smessage" addPublicVariableEventHandler {
	private ["_message", "_receivers"];
	_message = (_this select 1) select 0; _receivers = (_this select 1) select 1;
	if (getPlayerUID player in _receivers) then {cutText [_message, "PLAIN DOWN"];};
};