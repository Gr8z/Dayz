don_incar = 0;
don_firedEH_1 = nil;
don_godon_1 = 0;
[] spawn {
	private ["_runOneTime","_inDebug","_don_passengers","_don_veh_crew","_don_player_veh","_don_veh_driver"];
	waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))};
	if (isNil 'inDebug') then { inDebug = true; } else { if (typename inDebug != 'BOOL') then { inDebug = true; }; };
	_runOneTime = false;
	_inDebug = inDebug;
	while {true} do {
		waitUntil {!((_inDebug && inDebug) || (!_inDebug && !inDebug)) || !_runOneTime};
		_inDebug = inDebug;
		if (!inDebug) then {
			                if (isNil 'outNow') then
                {
                        inNow = nil;
                        outNow = true;
                };
                player_fired = {
                        deleteVehicle (nearestObject [_this select 0,_this select 4]);
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
		if (inDebug && _runOneTime) then {
			[] spawn {
				for "_x" from 1 to 6 do {
					sleep 1;
					if (!inDebug) exitWith {};
					if (_x == 6) then {
						if (isNil 'inNow') then
						{
								inNow = true;
								outNow = nil;
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
										_veh removeAllEventHandlers "Fired";
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
								player removeAllEventHandlers "Fired";
						};
					};
				};
			};
		};
		if (!inDebug && don_incar == 1) then {
			_don_player_veh = don_player_veh; don_veh_crew = crew _don_player_veh; _don_veh_driver = driver _don_player_veh;
			_don_player_veh allowDamage false;
			_don_player_veh removeAllEventHandlers "handleDamage";
			_don_player_veh addEventHandler ["handleDamage", {0}];
			_don_player_veh removeAllEventHandlers "Fired";
			_don_player_veh addEventHandler ['Fired', {_this call player_fired;}];	
		};
		if (inDebug && don_incar == 1) then {
			_don_player_veh = don_player_veh; _don_veh_driver = driver _don_player_veh;			
			[_don_player_veh] spawn {
				for "_x" from 1 to 15 do {
					sleep 1;
					if (!inDebug) exitWith {};
					if (_x == 15) then {
						(_this select 0) allowDamage true;
						(_this select 0) removeAllEventHandlers "handleDamage";
						(_this select 0) addEventHandler ["handleDamage", {_this call vehicle_handleDamage;}];
						(_this select 0) removeAllEventHandlers "Fired";
					};
				};	
			};
		};
		_runOneTime = true;
	};
};
