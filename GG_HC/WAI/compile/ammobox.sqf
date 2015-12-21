private ["_mission","_mags","_tool","_crate","_class","_numberofguns","_numberoftools","_weapon","_namecfg","_numberofitems","_item"];
_crate = _this select 0;
_allPlayers = playableUnits;

_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true];
PVOZ_GGHCaddtomonitor = [_crate];publicVariableServer "PVOZ_GGHCaddtomonitor";

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

_numberofguns = (round (random 2)) + wai_mission_numberofguns;
_numberoftools = (round (random 2)) + wai_mission_numberoftools;
_numberofitems = (round (random 2)) + wai_mission_numberofitems;

for "_i" from 1 to _numberofguns do {
	_weapon = ammo_crate_guns call BIS_fnc_selectRandom;
	_mags = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
	_crate addWeaponCargoGlobal [_weapon,1];
	_crate addMagazineCargoGlobal [(_mags select 0),round(random 2) + 1];
};
for "_i" from 1 to _numberoftools do {
	_tool = ammo_crate_tools call BIS_fnc_selectRandom;
	_crate addWeaponCargoGlobal [_tool,1];
};

for "_i" from 1 to _numberofitems do {
	_item = ammo_crate_items call BIS_fnc_selectRandom;
	_crate addMagazineCargoGlobal [_item,2];
};
if (count _allPlayers >= 10) then {
	{if ((random 100) > 30) then {_crate addMagazineCargoGlobal [_x select 0,_x select 1]}} forEach [
		["Itembriefcase50oz",ceil(random 10)],
		["CinderBlocks",ceil(random 40)],
		["metal_floor_kit",ceil(random 10)],
		["metal_panel_kit",ceil(random 5)],
		["cinder_wall_kit",ceil(random 15)],
		["ItemComboLock",ceil(random 6)]
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