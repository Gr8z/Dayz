private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
_loot_box = "USVehicleBox";
_loot_lists = [
[
["ItemToolbox","ItemToolbox","ItemToolbox","ItemCrowbar","ItemCrowbar","ItemCrowbar","ItemHotwireKit"], 
["MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole"]
],
[
["ItemToolbox","ItemToolbox","ItemToolbox","ItemCrowbar","ItemCrowbar","ItemCrowbar"], 
["CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole"]
],
[
["ItemToolbox","ItemToolbox","ItemToolbox","ItemCrowbar","ItemCrowbar","ItemCrowbar","ItemSledge"], 
["cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit"]
],
[
["ItemToolbox","ItemToolbox","ItemToolbox","ItemCrowbar","ItemCrowbar","ItemCrowbar","itemEtool"], 
["15Rnd_9x19_M9SD","workbench_kit","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","wood_shack_kit","wood_shack_kit","wood_shack_kit","deer_stand_kit","deer_stand_kit","ItemWoodLadder","ItemWoodLadder","desert_net_kit","desert_net_kit","ItemWoodLadder","ItemWoodLadder","desert_net_kit","forest_net_kit","forest_net_kit","forest_net_kit","desert_net_kit","desert_net_kit","ItemSandbagLarge","ItemSandbagLarge","Itemvault","Itemvault"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
waitUntil {!isNil "DZMSStatLocs"}; 
_loot_amount = 75;
_wait_time = 300; 
_start_time = time;
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
EPOCH_EVENT_RUNNING = true;
_position = DZMSStatLocs call BIS_fnc_selectRandom;
diag_log(format["Spawning loot event at %1", _position]);
_markerRadius = 350;
_markershape = "ELLIPSE";
_markercolor = "ColorGreen";
_missiontype = 0;
_refreshmarker = [_position,_markerRadius,_markershape,_markercolor,_missiontype,_start_time] execVM "\z\addons\dayz_server\modules\refreshmarker.sqf";
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
diag_log(format["Creating ammo box at %1", _loot_pos]);
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
_hint = parseText format["<t align='center' color='#00FF11' shadow='2' size='1.75'>Construction Crate</t><br/><t align='center' color='#ffffff'>Ikea Truck lost its Cargo, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);
waitUntil{
sleep 1;
(({isPlayer _x && _x distance _loot_box <= 5} count playableUnits > 0));
};
_hint = parseText format["<t align='center' color='#00FF11' shadow='2' size='1.75'>Construction Crate</t><br/><t align='center' color='#ffffff'>Ikea Truck Cargo Has been captured!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorGreen";
_debug_marker setMarkerAlpha 1;
EPOCH_EVENT_RUNNING = false;
sleep 30;
deleteMarker _event_marker;
sleep _wait_time;
deleteVehicle _loot_box;
deleteVehicle _clutter;
deleteMarker _debug_marker;