#include "shortcuts.h"
private ["_position","_unitTypes","_radius","_method","_agent"];

_position = _this sel 0;
_doLoiter = _this sel 1; // wander around
_unitTypes = _this sel 2; // class of wanted models
_maxControlledZombies = round(dayz_maxLocalZombies);

_cantSee = {
	private ["_isok"];

	_isok = true;
	_zPos = +(_this sel 0);
	if (count _zPos < 3) exw {
		diag_log fmt["%1::_cantSee illegal pos %2", __FILE__, _zPos];
		false
	};
	_zPos = ATLtoASL _zPos;
	_fov = _this sel 1; // players half field of view
	_safeDistance = _this sel 2; // minimum distance. closer is wrong
	_farDistance = _this sel 3; // distance further we won't check
	_zPos set [2, (_zPos sel 2) + 1.7];
	{
		_xasl = getPosASL _x;
		if (_xasl distance _zPos < _farDistance) then {
			if (_xasl distance _zPos < _safeDistance) then {
				_isok = false;
			}
			else {
				_eye = eyePos _x; // ASL
				_ed = eyeDirection _x;
				_ed = (_ed sel 0) atan2 (_ed sel 1);
				_deg = [_xasl, _zPos] call BIS_fnc_dirTo;
				_deg = (_deg - _ed + 720) % 360;
				if (_deg > 180) then { _deg = _deg - 360; };
				if ((abs(_deg) < _fov) && {( // in right angle sector?
						(!(terrainIntersectASL [_zPos, _eye]) // no terrain between?
						&& {(!(lineIntersects [_zPos, _eye]))}) // && no object between?
					)}) then {
					_isok = false;
				};
			};
		};
		if (!_isok) exw {false};
	} count playableUnits;

	_isok
};

if ((dayz_spawnZombies < _maxControlledZombies) && (dayz_CurrentNearByZombies < dayz_maxNearByZombies) && (dayz_currentGlobalZombies < dayz_maxGlobalZeds)) then {
	if ([_position, dayz_cantseefov, 10, dayz_cantseeDist] call _cantSee) then {
		//Check if anyone close
		_tooClose = {isPlayer _x} count (_position nearEntities ["CAManBase",30]) > 0;
		if (_tooClose) exw {
			// diag_log ("Zombie_Generate: was too close to player.");
		};

		//Add zeds if unitTypes equals 0
		if (count _unitTypes == 0) then {
			if (DZE_MissionLootTable) then {
				_unitTypes = []+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
			} else {
				_unitTypes = []+ getArray (xcf >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
			};
		};

		// lets create an agent
		_type = _unitTypes call BIS_fnc_selectRandom;
		_radius = 5;
		_method = "NONE";
		if (_doLoiter) then {
			_radius = 40;
			_method = "CAN_COLLIDE";
		};

		//Check if point is in water
		if (surfaceIsWater _position) exw {  };

		_agent = createAgent [_type, _position, [], _radius, _method];
		sleep 0.001;

		//add to global counter
		dayz_spawnZombies = dayz_spawnZombies + 1;

		//Add some loot
		_loot = "";
		_array = [];
		_rnd = random 1;
		if (_rnd < 0.2) then {
			_lootType = xcf >> "CfgVehicles" >> _type >> "zombieLoot";
			if (isText _lootType) then {
				_array = [];
				{
					_array set [count _array, _x sel 0]
				} forEach getArray (missionConfigFile >> "cfgLoot" >> getText(_lootType));
				if (count _array > 0) then {
					_index = dayz_CLBase find getText(_lootType);
					_weights = dayz_CLChances sel _index;
					_loot = _array sel (_weights sel (floor(random (count _weights))));
					if(!isNil "_array") then {
						_loot_count =	xgn(missionConfigFile >> "CfgMagazines" >> _loot >> "count");
						if(_loot_count>1) then {
							_agent addMagazine [_loot, ceil(random _loot_count)];
						} else {
						_agent addMagazine _loot;
						};
					};
				};
			};
		};

		_agent xsv["agentObject",_agent];

		if (!izn _agent) then {
			_agent setDir random 360;
			sleep 0.001;

			_position = getPosATL _agent;

			_favStance = (
				switch ceil(random(3^0.5)^2) do {
					case 2: {"Middle"}; // Kneel
					default {"UP"} // stand-up
				}
			);
			_agent setUnitPos _favStance;

			_agent xsv ["stance", _favStance];
			_agent xsv ["BaseLocation", _position];
			_agent xsv ["doLoiter", true]; // true: Z will be wandering, false: stay still
			_agent xsv ["myDest", _position];
			_agent xsv ["newDest", _position];
			[_agent, _position] call zombie_loiter;
		};

		//Disable simulation
		PVDZE_Server_Simulation = [_agent, false];
		publicVariableServer "PVDZE_Server_Simulation";

		//Start behavior
		_id = [_position,_agent] rf "GG\Epoch\zombie_agent.fsm";
	};
};
