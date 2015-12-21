private ["_ammo","_tool","_crate","_weapon","_item","_backpack","_num_tools","_num_items","_num_backpacks","_num_weapons","_weapons_array","_tool_array","_item_array","_backpack_array"];
_allPlayers = playableUnits;
_crate = _this select 0;
_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true];

if (typeName (_this select 1) == "ARRAY") then {
	_num_weapons	= (_this select 1) select 0;
	_weapons_array	= (_this select 1) select 1;
} else {
	_num_weapons	= _this select 1;
	_weapons_array	= ai_wep_random call BIS_fnc_selectRandom;;
};

if (typeName (_this select 2) == "ARRAY") then {
	_num_tools	= (_this select 2) select 0;
	_tool_array = (_this select 2) select 1;
} else {
	_num_tools	= _this select 2;
	_tool_array = crate_tools;
};

if (typeName (_this select 3) == "ARRAY") then {
	_num_items	= (_this select 3) select 0;
	_item_array	= (_this select 3) select 1;
} else {
	_num_items	= _this select 3;
	_item_array	= crate_items;
};

if (typeName (_this select 4) == "ARRAY") then {
	_num_backpacks	= (_this select 4) select 0;
	_backpack_array = (_this select 4) select 1;
} else {
	_num_backpacks = _this select 4;
	_backpack_array = crate_backpacks_all;
};

if (debug_mode) then {
	diag_log format["WAI: Spawning in a dynamic crate with %1 guns, %2 tools, %3 items and %4 backpacks",_num_weapons,_num_tools,_num_items,_num_backpacks];
};

if (count _allPlayers < 10) then {
	if (_num_weapons > 1) then {_num_weapons = round (_num_weapons / 3)};
	if (_num_tools > 1) then {_num_tools = round (_num_tools / 3)};
	if (_num_items > 1) then {_num_items = round (_num_items / 3)};
} else {
	if (count _allPlayers >= 25) then {
		if (_num_weapons > 1) then {_num_weapons = round (_num_weapons * 1.5)};
		if (_num_tools > 1) then {_num_tools = round (_num_tools * 1.5)};
		if (_num_items > 1) then {_num_items = round (_num_items * 1.5)};
	};
};

PVOZ_damiHCaddtomonitor = [_crate];publicVariableServer "PVOZ_damiHCaddtomonitor";

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

if (_num_weapons > 0) then {
	_num_weapons = (ceil((_num_weapons) / 2) + ceil(random (_num_weapons / 2)));
	for "_i" from 1 to _num_weapons do {
		_weapon = _weapons_array call BIS_fnc_selectRandom;
		_ammo = _weapon call find_suitable_ammunition;
		_crate addWeaponCargoGlobal [_weapon,1];
		_crate addMagazineCargoGlobal [_ammo, (1 + ceil(random 5))];
	};
};
if (_num_tools > 0) then {
	_num_tools	= (ceil((_num_tools) / 2) + ceil(random (_num_tools / 2)));
	for "_i" from 1 to _num_tools do {
		_tool = _tool_array call BIS_fnc_selectRandom;
		if (typeName (_tool) == "ARRAY") then {
			_crate addWeaponCargoGlobal [_tool select 0,_tool select 1];
		} else {
			_crate addWeaponCargoGlobal [_tool,1];
		};
	};

};
if (_num_items > 0) then {
	_num_items	= (ceil((_num_items) / 2) + ceil(random (_num_items / 2)));
	for "_i" from 1 to _num_items do {
		_item = _item_array call BIS_fnc_selectRandom;

		if (typeName (_item) == "ARRAY") then {
			_crate addMagazineCargoGlobal [_item select 0,_item select 1];
		} else {
			_crate addMagazineCargoGlobal [_item,1];
		};
	};

};
if (_num_backpacks > 0) then {
	_num_backpacks	= (ceil((_num_backpacks) / 2) + ceil(random (_num_backpacks / 2)));
	for "_i" from 1 to _num_backpacks do {
		_backpack = _backpack_array call BIS_fnc_selectRandom;

		if (typeName (_backpack) == "ARRAY") then {
			_crate addBackpackCargoGlobal [_backpack select 0,_backpack select 1];
		} else {
			_crate addBackpackCargoGlobal [_backpack,1];
		};
	};

};
if (wai_high_value) then {
	if (random 100 < wai_high_value_chance) then {
		_item = crate_items_high_value call BIS_fnc_selectRandom;
		_crate addMagazineCargoGlobal [_item,1];
	};
};
for "_i" from 1 to ((round (random 2)) + wai_mission_numberofguns) do {
	_weapon = ammo_crate_guns call BIS_fnc_selectRandom;
	_mags = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
	_crate addWeaponCargoGlobal [_weapon,1];
	_crate addMagazineCargoGlobal [(_mags select 0),round(random 2) + 1];
};
if (count _allPlayers >= 10) then {
	{if ((random 100) > 50) then {_crate addMagazineCargoGlobal [_x select 0,_x select 1]}} forEach [
		["Itembriefcase100oz",ceil(random 5)],
		["CinderBlocks",ceil(random 40)],
		["metal_floor_kit",ceil(random 10)],
		["metal_panel_kit",ceil(random 5)],
		["cinder_wall_kit",ceil(random 10)],
		["ItemComboLock",ceil(random 6)],
		["ItemKeyKit",ceil(random 3)]
	];
};
if (count _allPlayers >= 15) then {
	{if ((random 100) > 60) then {_crate addMagazineCargoGlobal [_x select 0,_x select 1]}} forEach [
		["Itembriefcase100oz",ceil(random 4)],
		["2000Rnd_762x51_M134",ceil(random 5)],
		["150Rnd_127x107_DSHKM",ceil(random 6)],
		["100Rnd_127x99_M2",ceil(random 6)],
		["48Rnd_40mm_MK19",ceil(random 3)],
		["29Rnd_30mm_AGS30",ceil(random 2)]
	];
};
if (count _allPlayers >= 25) then {
	_added = 0;
	{
		if (((random 100) > 80)&&(_added < 3)) then {
			_added = _added + 1;
			_mags = getArray (configFile >> "cfgWeapons" >> _x >> "magazines");
			_crate addWeaponCargoGlobal [_x,round(random 2)];
			_crate addMagazineCargoGlobal [(_mags select 0),round(random 2) + 1];
		};
	} forEach [
		"MAAWS",
		"M107_DZ",
		"SCAR_H_LNG_SNIPER_SD",
		"SCAR_H_STD_EGLM_SPECT",
		"KSVK_DZE",
		"BAF_LRR_scoped",
		"M110_NVG_EP1",
		"VSS_Vintorez",
		"BAF_AS50_scoped",
		"RPG18"
	];
};