#include "shortcuts.h"
private ["_unitTypes","_lootType","_lootTypeCfg","_loot_count","_index","_weights","_loot","_array","_player","_doLoiter","_agent","_type","_radius","_method","_position","_isAlive","_myDest","_newDest","_rnd","_id"];
_player = _this sel 0;

_unitTypes = [];
if (DZE_MissionLootTable) then {
	_unitTypes = 	[]+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
} else {
	_unitTypes = 	[]+ getArray (xcf >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
_doLoiter = 	true;

_loot = 	"";
_array = 	[];
_agent = 	objNull;

_type = _unitTypes call BIS_fnc_selectRandom;

_radius = 40;
_method = "NONE";

_position = [_player,120,200,10,0,0,0] call BIS_fnc_findSafePos;

_agent = createAgent [_type, _position, [], _radius, _method];

if (_doLoiter) then {
	_agent setDir round(random 180);
};

dayz_spawnZombies = dayz_spawnZombies + 1;

if (random 1 > 0.7) then {
	_agent setUnitPos "Middle";
};

if (izn _agent) exw {
	dayz_spawnZombies = dayz_spawnZombies - 1;
};

_isAlive = alive _agent;

_myDest = getPosATL _agent;
_newDest = getPosATL _agent;
_agent xsv ["myDest",_myDest];
_agent xsv ["newDest",_newDest];

//Add some loot
_rnd = random 1;
if (_rnd > 0.3) then {
	if (DZE_MissionLootTable) then {
		_lootType = getText (missionConfigFile >> "CfgVehicles" >> _type >> "zombieLoot");
	} else {
		_lootType = getText (xcf >> "CfgVehicles" >> _type >> "zombieLoot");
	};

	if (DZE_MissionLootTable) then {
		_lootTypeCfg = getArray (missionConfigFile >> "CfgLoot" >> _lootType);
	} else {
		_lootTypeCfg = getArray (xcf >> "CfgLoot" >> _lootType);
	};
	_array = [];
	{
		_array set [count _array, _x sel 0]
	} count _lootTypeCfg;
	if (count _array > 0) then {
		_index = dayz_CLBase find _lootType;
		_weights = dayz_CLChances sel _index;
		_loot = _array sel (_weights sel (floor(random (count _weights))));
		if(!isNil "_array") then {
			if (DZE_MissionLootTable) then {
				_loot_count =	xgn(missionConfigFile >> "CfgMagazines" >> _loot >> "count");
			} else {
				_loot_count =	xgn(xcf >> "CfgMagazines" >> _loot >> "count");
			};
			if(_loot_count>1) then {
				_agent addMagazine [_loot, ceil(random _loot_count)];
			} else {
				_agent addMagazine _loot;
			};
		};
	};
};

//Start behavior
_id = [_position,_agent] rf "GG\zombie_agent.fsm";