zombie_loiter = {
	private ["_unit","_originalPos","_pos","_chance","_playerpos"];
	_unit = _this select 0;
	_originalPos = _this select 1;
	_pos = getPosATL _unit;
	_playern = objNull;
	{if (isPlayer _x) exitWith {_playern = _x}} forEach (nearestObjects [_unit,["CAManBase"],250]);
	_playerpos = ([_playern] call FNC_GetPos);

	if (count _this > 2) then {_pos = _this select 2} else {
		_chance =	round(random 12);
		if ((_chance % 4) == 0) then {
			_pos = [_playerpos,30,120,4,0,5,0] call BIS_fnc_findSafePos;
		} else {
			_pos = [_originalPos,10,90,4,0,5,0] call BIS_fnc_findSafePos;
		};
		if (_unit distance _playern > 250) then {
			_pos = [_playerpos,120,200,4,0,5,0] call BIS_fnc_findSafePos;
		};
	};
	if (isNull group _unit) then {_unit moveTo _pos} else {_unit domove _pos};
	_unit forceSpeed 2;
	_unit setVariable ["myDest",_pos];
};
zombie_generate = {
	private ["_position","_unitTypes","_radius","_method","_agent"];
	_position = _this select 0;
	_doLoiter = _this select 1;
	_unitTypes = _this select 2;
	_maxControlledZombies = round(dayz_maxLocalZombies);
	_cantSee = {
		private ["_isok"];
		_isok = true;
		_zPos = +(_this select 0);
		if (count _zPos < 3) exitWith {diag_log format["%1::_cantSee illegal pos %2", __FILE__, _zPos];false};
		_zPos = ATLtoASL _zPos;
		_fov = _this select 1;
		_safeDistance = _this select 2;
		_farDistance = _this select 3;
		_zPos set [2, (_zPos select 2) + 1.7];
		_allPlayers =  playableUnits;
		{
			_xasl = getPosASL _x;
			if (_xasl distance _zPos < _farDistance) then {
				if (_xasl distance _zPos < _safeDistance) then {
					_isok = false;
				} else {
					_eye = eyePos _x;
					_ed = eyeDirection _x;
					_ed = (_ed select 0) atan2 (_ed select 1);
					_deg = [_xasl, _zPos] call BIS_fnc_dirTo;
					_deg = (_deg - _ed + 720) % 360;
					if (_deg > 180) then { _deg = _deg - 360; };
					if ((abs(_deg) < _fov) && {((!(terrainIntersectASL [_zPos, _eye]) && {(!(lineIntersects [_zPos, _eye]))}))}) then {
						_isok = false;
					};
				};
			};
			if (!_isok) exitWith {false};
		} count _allPlayers;
		_isok
	};
	if ((dayz_spawnZombies < _maxControlledZombies) && (dayz_CurrentNearByZombies < dayz_maxNearByZombies) && (dayz_currentGlobalZombies < dayz_maxGlobalZeds)) then {
		if ([_position, dayz_cantseefov, 10, dayz_cantseeDist] call _cantSee) then {
			_tooClose = {isPlayer _x} count (_position nearEntities ["CAManBase",30]) > 0;
			if (_tooClose) exitwith {};
			if (count _unitTypes == 0) then {
				if (DZE_MissionLootTable) then {
					_unitTypes = []+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
				} else {
					_unitTypes = []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
				};
			};
			_type = _unitTypes call BIS_fnc_selectRandom;
			_radius = 5;
			_method = "NONE";
			if (_doLoiter) then {
				_radius = 40;
				_method = "CAN_COLLIDE";
			};
			if (surfaceIsWater _position) exitwith {  };
			_agent = createAgent [_type, _position, [], _radius, _method];
			sleep 0.001;
			dayz_spawnZombies = dayz_spawnZombies + 1;
			_loot = "";
			_array = [];
			_rnd = random 1;
			if (_rnd < 0.2) then {
				_lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";
				if (isText _lootType) then {
					_array = [];
					{_array set [count _array, _x select 0]} count getArray (configFile >> "cfgLoot" >> getText(_lootType));
					if (count _array > 0) then {
						_index = dayz_CLBase find getText(_lootType);
						_weights = dayz_CLChances select _index;
						_loot = _array select (_weights select (floor(random (count _weights))));
						if(!isNil "_array") then {
							_loot_count =	getNumber(configFile >> "CfgMagazines" >> _loot >> "count");
							if(_loot_count>1) then {
								_agent addMagazine [_loot, ceil(random _loot_count)];
							} else {_agent addMagazine _loot};
						};
					};
				};
			};
			_agent setVariable["agentObject",_agent];
			if (!isNull _agent) then {
				_agent setDir random 360;
				sleep 0.001;
				_position = getPosATL _agent;
				_favStance = (
					switch ceil(random(3^0.5)^2) do {
						case 2: {"Middle"};
						default {"UP"}
					}
				);
				_agent setUnitPos _favStance;
				_agent setVariable ["stance", _favStance];
				_agent setVariable ["BaseLocation", _position];
				_agent setVariable ["doLoiter", true];
				_agent setVariable ["myDest", _position];
				_agent setVariable ["newDest", _position];
				[_agent, _position] call zombie_loiter;
			};
			PVDZE_Server_Simulation = [_agent, false];
			publicVariableServer "PVDZE_Server_Simulation";
			_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";
		};
	};
};
building_spawnZombies = {
	private ["_obj","_type","_config","_canLoot","_unitTypes","_min","_max","_num","_zombieChance","_rnd","_position","_positions","_iPos","_nearBy","_noOneNear"];
	if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
	if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
	if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 
	_obj = _this select 0;
	_type = typeOf _obj;
	_config = if (DZE_MissionLootTable) then [{missionConfigFile >> "CfgBuildingLoot" >> _type},{configFile >> "CfgBuildingLoot" >> _type}]
	_canLoot = isClass (_config);

	if (_canLoot) then {
		_zombieChance =	getNumber (_config >> "zombieChance");
		_rnd = random 1;
		_unitTypes = getArray (_config >> "zombieClass");
		_min = getNumber (_config >> "minRoaming");
		_max = getNumber (_config >> "maxRoaming");
		_num = (round(random _max)) max _min;
		_position = getPosATL _obj;		
		_noOneNear = (count (_position nearEntities ["CAManBase",30])) == 0;
		if (_noOneNear) then {
			_positions = getArray (_config >> "lootPosZombie");
			if (count _positions > 0) then {
				{
					if (random 1 < _zombieChance) then {
						_iPos = _obj modelToWorld _x;
						_nearBy =  count (_iPos nearEntities ["zZombie_Base",1]) > 0;
						if (!_nearBy) then {
							[_iPos,true,_unitTypes] call zombie_generate;
						};
					};
				} count _positions;
			} else {
				for "_i" from 1 to _num do {
					if (random 1 < _zombieChance) then {
						[_position,true,_unitTypes] call zombie_generate;
					};
				};
			};
		};
	};
};
building_spawnLoot = {
	private ["_lootChance"];
	_obj = _this;
	_type = toLower(typeOf _obj);
	_config = configFile >> "CfgBuildingLoot" >> _type;
	if (DZE_MissionLootTable) then {_config = missionConfigFile >> "CfgBuildingLoot" >> _type};
	_pos = [] + getArray (_config >> "lootPos");
	_itemTypes = [] + getArray (_config >> "lootType");
	_lootChance = getNumber (_config >> "lootChance");
	_qty = 0;
	_lootSpawnBias = 67;
	_ShuffleArray = {
		private ["_ar","_rand_array","_rand"];
		_ar = _this;
		_rand_array = [];
		while {count _ar > 0} do {
			_rand = (count _ar);
			_rand = floor (random _rand);
			_rand_array set [count _rand_array, _ar select _rand];
			_ar set [_rand, "randarray_del"];
			_ar = _ar - ["randarray_del"];
		};
		_rand_array;
	};
	_positions = _pos call _ShuffleArray;
	_bias = 50 max _lootSpawnBias;
	_bias = 100 min _bias;
	_bias = (_bias + random(100 - _bias)) / 100;
	{
		if (count _x == 3) then {
			_rnd = (random 1) / _bias;
			_iPos = _obj modelToWorld _x;
			_nearBy = nearestObjects [_iPos, ["ReammoBox"], 2];
			if (count _nearBy > 0) then {_lootChance = _lootChance + 0.05};
			if (dayz_currentWeaponHolders < dayz_maxMaxWeaponHolders) then {
				if (_rnd <= _lootChance) then {
					if (count _nearBy == 0) then {
						_index = dayz_CBLBase find _type;
						_weights = dayz_CBLChances select _index;
						_cntWeights = count _weights;
						_index = floor(random _cntWeights);
						_index = _weights select _index;
						_itemType = _itemTypes select _index;
						[_itemType select 0, _itemType select 1 , _iPos, 0.0] call spawn_loot;
						dayz_currentWeaponHolders = dayz_currentWeaponHolders + 1;
						_obj setVariable ["looted", (DateToNumber date)];
					};
				};
			};
		};
	} forEach _positions;
	_posSmall =	 [] + getArray (_config >> "lootPosSmall");
	_itemTypesSmall =	[] + getArray (_config >> "lootTypeSmall");
	_positionsSmall = _posSmall call _ShuffleArray;
	{
		if (count _x == 3) then {
			_rnd = (random 1) / _bias;
			_iPos = _obj modelToWorld _x;
			_nearBy = nearestObjects [_iPos, ["ReammoBox"], 2];
			if (count _nearBy > 0) then {_lootChance = _lootChance + 0.05};
			if (dayz_currentWeaponHolders < dayz_maxMaxWeaponHolders) then {
				if (_rnd <= _lootChance) then {
					if (count _nearBy == 0) then {
						_index = dayzE_CBLSBase find _type;
						_weights = dayzE_CBLSChances select _index;
						_cntWeights = count _weights;
						_index = floor(random _cntWeights);
						_index = _weights select _index;
						_itemType = _itemTypesSmall select _index;
						[_itemType select 0, _itemType select 1, _iPos, 0.0] call spawn_loot_small;
						dayz_currentWeaponHolders = dayz_currentWeaponHolders +1;
						_obj setVariable ["looted",(DateToNumber date)];
					};
				};
			};
		};
	} forEach _positionsSmall;
};
_allPlayers = playableUnits;
{
	private ["_type","_inVehicle","_dateNow","_maxWildZombies","_age","_radius","_position","_markerstr","_markerstr1","_markerstr2","_markerstr3","_nearByObj","_handle","_looted","_cleared","_zombied","_config","_canLoot","_dis","_players","_nearby","_nearbyCount","_onTheMove","_soundLimit"];
	_playerx
	_type 		= _this select 0;
	_inVehicle 	= (vehicle _playerx != _playerx);
	_onTheMove 	= (speed (vehicle _playerx) > 10);
	_dateNow 	= (DateToNumber date);
	_age 		= -1;
	_radius 	= 200;
	_position 	= _playerx call AH_fnc_getPos;
	_soundLimit = 2;
	
	dayz_spawnZombies = 0;
	dayz_CurrentZombies = 0;
	{
		if (!alive _x) then {
			if (!(_x isKindOf "zZombie_Base")) then {
				[_playerx,"flysound",1,true] call dayz_zombieSpeak;
				_soundLimit = _soundLimit - 1;
			};
		};
		if (_soundLimit == 0) exitWith {};
	} count (nearestObjects [_playerx, ["CAManBase"], 8]);
	
	_players = _position nearEntities ["CAManBase",_radius+200];
	dayz_maxGlobalZombies = dayz_maxGlobalZombiesInit;
	{
		if (isPlayer _x) then {dayz_maxGlobalZombies = dayz_maxGlobalZombies + dayz_maxGlobalZombiesIncrease} else {
			if (_x isKindOf "zZombie_Base") then {
				if (local _x) then {dayz_spawnZombies = dayz_spawnZombies + 1};
				dayz_CurrentZombies = dayz_CurrentZombies + 1;
			};
		};
	} count _players;
	
	_nearby = _position nearObjects ["building",_radius];
	_nearbyCount = count _nearby;
	if (_nearbyCount < 1) exitWith {if ((dayz_spawnZombies < 3) && !_inVehicle)  then {[_position] call wild_spawnZombies}};
	{
		_type 	= typeOf _x;
		_config = if (DZE_MissionLootTable) then [{missionConfigFile >> "CfgBuildingLoot" >> _type},{configFile >> "CfgBuildingLoot" >> _type}];
		if (isClass (_config)) then {
			_dis = _x distance _playerx;
			if ((_dis < 120) && (_dis > 30) && !_inVehicle) then {
				_looted = (_x getVariable["looted",-0.1]);
				_cleared = (_x getVariable["cleared",true]);
				_dateNow = (DateToNumber date);
				_age = (_dateNow - _looted) * 525948;
				if ((_age > DZE_LootSpawnTimer) && (!_cleared)) then {
					_nearByObj = nearestObjects [(_x call AH_fnc_getPos), ["WeaponHolder","WeaponHolderBase"],((sizeOf _type)+5)];
					{deleteVehicle _x} count _nearByObj;
					_x setVariable ["cleared",true,true];
					_x setVariable ["looted",_dateNow,true];
				};
				if ((_age > DZE_LootSpawnTimer) && (_cleared)) then {
					_x setVariable ["looted",_dateNow,true];
					_x call building_spawnLoot;
				};
			};
			if (!_onTheMove) then {
				if ((time - dayz_spawnWait) > dayz_spawnDelay) then {
					if (dayz_maxCurrentZeds < dayz_maxZeds) then {
						if (dayz_CurrentZombies < dayz_maxGlobalZombies) then {
							if (dayz_spawnZombies < dayz_maxLocalZombies) then {
									_zombied = (_x getVariable["zombieSpawn",-0.1]);
									_dateNow = (DateToNumber date);
									_age = (_dateNow - _zombied) * 525948;
									if (_age > 3) then {
										_x setVariable ["zombieSpawn",_dateNow,true];
										[_x] call building_spawnZombies;
									};
							} else {dayz_spawnWait = time};
						};
					};
				};
			};
		};
	} forEach _nearby;
} forEach _allPlayers;