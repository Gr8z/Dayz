private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.50; // Percentage chance of event happening

_loot_box = "GuerillaCacheBox";
_loot_lists = [
[
["AKS_GOLD"],
["30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz"]
],
[
["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz"]
],
[
["AKS_GOLD"],
["30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar"]
],
[
["revolver_gold_EP1"],
["6Rnd_45ACP","6Rnd_45ACP","6Rnd_45ACP","ItemBriefcase100oz"]
],
[
["AKS_GOLD"],
["30Rnd_762x39_AK47","30Rnd_762x39_AK47","30Rnd_762x39_AK47","ItemGoldBar","ItemCopperBar","ItemGoldBar10oz","ItemSilverBar10oz","ItemTinBar","ItemSilverBar","ItemGoldBar","ItemCopperBar","ItemGoldBar10oz","ItemSilverBar10oz","ItemTinBar","ItemSilverBar"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 75;
_wait_time = 300; 
 
// Dont mess with theses unless u know what yours doing
_start_time = time;
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 
// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance) exitWith {};

EPOCH_EVENT_RUNNING = true;
 
// Random location
_position = DZMSStatLocs call BIS_fnc_selectRandom;
 
diag_log(format["Spawning loot event at %1", _position]);
 
_markerRadius = 350;
_markershape = "ELLIPSE";
_markercolor = "ColorYellow";
_missiontype = 0;
_refreshmarker = [_position,_markerRadius,_markershape,_markercolor,_missiontype,_start_time] execVM "\z\addons\dayz_server\modules\refreshmarker.sqf";
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
 
// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='center' color='#FFFF66' shadow='2' size='1.75'>Treasure Crate</t><br/><t align='center' color='#ffffff'>Bandits or Pirates? We found their treasure, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

//Wait until player is Near.
waitUntil{
sleep 1;
(({isPlayer _x && _x distance _loot_box <= 5} count playableUnits > 0));
};

_hint = parseText format["<t align='center' color='#00FF11' shadow='2' size='1.75'>Construction Crate</t><br/><t align='center' color='#ffffff'>Treasure was retrieved by %1 !</t>",name _x];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorYellow";
_debug_marker setMarkerAlpha 1;

EPOCH_EVENT_RUNNING = false;
sleep 30;
deleteMarker _event_marker;

// Wait
sleep _wait_time;
 
// Clean up
deleteVehicle _loot_box;
deleteVehicle _clutter;
deleteMarker _debug_marker;