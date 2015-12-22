#include "shortcuts.h"
private ["_gearmenu","_playerPos","_nearWeed","_weed","_objectID","_objectUID","_onLadder","_vehicle","_inVehicle","_playernear"];
_playerPos = getPosATL player;
_nearWeed = count nearestObjects [_playerPos, ["fiberplant"], 4] > 0;
_weed = nearestObject [player, "fiberplant"];
_onLadder =		(xgn (xcf >> "CfgMovesMaleSdr" >> "States" >> (xas player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder);
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

if !(_nearWeed) exw {
	cutText [fmt["You need to be near the weed plants in order to harvest."], "PLAIN DOWN"];
};
if !(_canDo) exw {
	cutText [fmt["Error: You cannot harvest weed."], "PLAIN DOWN"];
};
if (_inVehicle) exw {
	cutText [fmt["You cannot harvest Weed While in a vehicle"], "PLAIN DOWN"];
};

if (dayz_combat == 1) then { 
    cutText [fmt["You are in Combat and Cannot harvest the Weed."], "PLAIN DOWN"];
} else {
	disableSerialization;
	_gearmenu = FindDisplay 106;
	_gearmenu CloseDisplay 106;
	[10,10] call dayz_HungerThirst;
	player playActionNow "Medic";
	r_interrupt = false;
	sleep 5;
	[10,10] call dayz_HungerThirst;
	player playActionNow "Medic";
	sleep 1;
	if (count nearestObjects [_playerPos, ["fiberplant"], 4] = 0) exw {
	cutText [fmt["You need to be near the weed plants in order to harvest."], "PLAIN DOWN"];
	};
	_objectID = _weed xgv ["ObjectID","0"];
	_objectUID = _weed xgv ["ObjectUID","0"];
	deleteVehicle _weed;
	[_objectID,_objectUID] call server_deleteObj;
	_weed setDamage 1;
	sleep 5;
	player addMagazine "ItemKiloHemp";
	sleep 2;
	cutText [fmt["You've Gathered Some Weed! Smoke it or sell it at Black market dealer!!"], "PLAIN DOWN"];	
};