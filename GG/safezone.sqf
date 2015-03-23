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
			                if (isNil 'outNow') then
                {
                        _msg = 'You entered a Safe Zone!';
                        hint _msg;
                        taskHint [_msg, [0,1,0,1], 'taskDone'];
                        inNow = nil;
                        outNow = true;
                       
                        if (LOG_EnterLeave) then
                        {
                                PVDZE_send = [player,'SafeZoneState',[1]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired = {
                        deleteVehicle (nearestObject [_this select 0,_this select 4]);
                        cutText ['You can not fire in a SafeZone!','WHITE IN'];
                };
                wild_spawnZombies = {};
                zombie_generate = {};
               
                fnc_usec_damageHandler = {};
                player removeAllEventHandlers 'handleDamage';
                player addEventHandler ['handleDamage', {false}];
                player allowDamage false;
                _veh = vehicle player;
                _szs = _veh getVariable ['inSafeZone',0];
                if (_szs == 0) then
                {
                        _veh setVariable ['inSafeZone',1,true];
                        if (player != _veh) then
                        {
                                _veh removeAllEventHandlers 'Fired';
                                _veh addEventHandler ['Fired', {_this call player_fired;}];
                                {
                                        _x removeAllEventHandlers 'Fired';
                                        _x addEventHandler ['Fired', {_this call player_fired;}];
                                } forEach (crew _veh);
                                vehicle_handleDamage = {false};
                                _veh removeAllEventHandlers 'HandleDamage';
                                _veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
                                _veh allowDamage false;
                        };
                };
                _notInSafeZone =
                [
                        'MAAWS','RPG7V','M136','RPG18','STINGER',
                        'MeleeHatchet_DZE','MeleeHatchet','MeleeCrowbar','MeleeMachete','MeleeFishingPole','MeleeSledge',
                        'MeleeBaseBallBatNails','MeleeBaseBallBatBarbed','MeleeBaseBallBat'
                ];
                _cwep = currentWeapon player;
                if (_cwep in _notInSafeZone) then
                {
                        _swep = '';
                        {
                                if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
                                {
                                        _swep = _x;
                                };
                        } forEach (weapons player);
                        if (_swep == '') then
                        {
                                player playActionNow 'PutDown';
                                _iPos = getPosATL player;
                                _radius = 1;
                                _removed = ([player,_cwep,1] call BIS_fnc_invRemove);
                                if (_removed == 1) then
                                {
                                        _item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
                                        _item addWeaponCargoGlobal [_cwep,1];
                                };
                        }
                        else
                        {
                                player selectweapon _swep;
                        };
                };
		};
		if (canbuild && _runOneTime) then {
			[] spawn {
				for "_x" from 1 to 30 do {
					if (_x >= 6) then {cutText [format ["SAFEZONE ENDS IN %1s", 31-_x], "PLAIN DOWN"];};
					sleep 1;
					if (!canbuild) exitWith {};
					if (_x == 30) then {
						if (isNil 'inNow') then
						{
								if (str fnc_usec_damageHandler == '{}') then
								{
										_msg = 'GOD MODE OFF AND WEAPONS ACTIVATEd';
										hint _msg;
										taskHint [_msg, [1,0,0.1,1], 'taskFailed'];
								};
								inNow = true;
								outNow = nil;
							   
								if (LOG_EnterLeave) then
								{
										PVDZE_send = [player,'SafeZoneState',[0]];
										publicVariableServer 'PVDZE_send';
								};
						};
						wild_spawnZombies = compile preprocessFileLineNumbers 'GG\zombies\wild_spawnZombies.sqf';
						zombie_generate = compile preprocessFileLineNumbers 'GG\zombies\zombie_generate.sqf';
					   
					   
						player_fired = {
								_this call compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
								_unit = _this select 0;
								_weapon = _this select 1;
								_muzzle = _this select 2;
								_mode = _this select 3;
								_ammo = _this select 4;
								_magazine = _this select 5;
								_projectile = _this select 6;
								_screenToWorld = screenToWorld [0.5,0.5];
								_near = _screenToWorld nearEntities ['AllVehicles',100];
								{
										if (isPlayer _x) then
										{
												_szs = _x getVariable ['inSafeZone',0];
												if (_szs == 1) then
												{
														deleteVehicle (nearestObject [_unit,_ammo]);
												};
										};
								} forEach _near;
						};
					   
						fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
						object_monitorGear = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
						vehicle_handleDamage = compile preprocessFileLineNumbers 'GG\vehicle_handleDamage.sqf';
					   
						_veh = vehicle player;
						_szs = _veh getVariable ['inSafeZone',0];
						if (_szs == 1) then
						{
								_veh setVariable ['inSafeZone',0,true];
								if (player != _veh) then
								{
										_veh removeAllEventHandlers 'HandleDamage';
										_veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
										_veh allowDamage true;
								};
						};
					   
						_end = false;
						if (isNil 'gmadmin') then
						{
								_end = true;
						}
						else
						{
								if (gmadmin == 0) then
								{
										_end = true;
								};
						};
						if (_end) then
						{
								player allowDamage true;
								fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
								player removeAllEventHandlers 'HandleDamage';
								player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
						};
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