private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];

_loot_box = "USVehicleBox";
//Random Loot List
_loot_lists = [
[
["M9SD"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaRbull","Skin_Sniper1_DZ","Skin_Sniper1_DZ","ItemSodaRbull","ItemSodaR4z0r","ItemSodaR4z0r","ItemTunaCooked","ItemTunaCooked","PartEngine","PartEngine","PartGlass","PartGlass","PartGlass","PartGeneric","PartGeneric","PartWheel","PartWheel","PartWheel","PartWheel","PartFueltank","ItemFuelBarrel","ItemFuelBarrel","PartVRotor"],
["DZ_LargeGunBag_EP1"]
],
[
["M9SD"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaRbull","Skin_Sniper1_DZ","Skin_Sniper1_DZ","ItemSodaRbull","ItemSodaR4z0r","ItemSodaR4z0r","ItemTunaCooked","ItemTunaCooked","PartEngine","PartEngine","PartGlass","PartGlass","PartGlass","PartGeneric","PartGeneric","PartWheel","PartWheel","PartWheel","PartWheel","PartFueltank","ItemFuelBarrel","ItemFuelBarrel","PartVRotor"],
["DZ_LargeGunBag_EP1"]
],
[
["M9SD"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaRbull","Skin_Sniper1_DZ","Skin_Sniper1_DZ","ItemSodaRbull","ItemSodaR4z0r","ItemSodaR4z0r","ItemTunaCooked","ItemTunaCooked","PartEngine","PartEngine","PartGlass","PartGlass","PartGlass","PartGeneric","PartGeneric","PartWheel","PartWheel","PartWheel","PartWheel","PartFueltank","ItemFuelBarrel","ItemFuelBarrel","PartVRotor"],
["DZ_LargeGunBag_EP1"]
],
[
["M9SD"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaRbull","Skin_Sniper1_DZ","Skin_Sniper1_DZ","ItemSodaRbull","ItemSodaR4z0r","ItemSodaR4z0r","ItemTunaCooked","ItemTunaCooked","PartEngine","PartEngine","PartGlass","PartGlass","PartGlass","PartGeneric","PartGeneric","PartWheel","PartWheel","PartWheel","PartWheel","PartFueltank","ItemFuelBarrel","ItemFuelBarrel","PartVRotor"],
["DZ_LargeGunBag_EP1"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
waitUntil {!isNil "AIMissionStatLocs"}; 
 
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
 

EPOCH_EVENT_RUNNING = true;
 
// Random location
_position = AIMissionStatLocs call BIS_fnc_selectRandom;
 
diag_log(format["Spawning loot event at %1", _position]);

_markerRadius = 350;
_markershape = "ELLIPSE";
_markercolor = "ColorBlue";
_missiontype = 0;
_refreshmarker = [_position,_markerRadius,_markershape,_markercolor,_missiontype,_start_time] execVM "\z\addons\dayz_server\missions\Crate Missions\refreshmarker.sqf";
 
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
{
_loot_box addBackpackCargoGlobal [_x,1];
} forEach (_loot select 2);
 
_txt = "Supply Crate Dropped!\nCheck your map!";
_colortask = [0.051,0,1,1];
_tasktype = "taskNew";
fnc_show_colorMiddleMsg = [_txt,_colortask,_tasktype];
publicVariable 'fnc_show_colorMiddleMsg';

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

//Wait until player is Near.
waitUntil{
sleep 1;
(({isPlayer _x && _x distance _loot_box <= 5} count playableUnits > 0));
};

_txt = "Supply Crate Secured!";
_colortask = [0.051,0,1,1];
_tasktype = "taskDone";
fnc_show_colorMiddleMsg = [_txt,_colortask,_tasktype];
publicVariable 'fnc_show_colorMiddleMsg';

_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorBlue";
_debug_marker setMarkerAlpha 1;

EPOCH_EVENT_RUNNING = false;
sleep 30;

// Wait
sleep _wait_time;
 
// Clean up
deleteVehicle _loot_box;
deleteVehicle _clutter;
deleteMarker _debug_marker;
