private ["_cnt","_pos"];

if (getPlayerUID player in BuildDonor) then { DZE_BuildingLimit = 300;} else {DZE_BuildingLimit = 150; };
_pos = [player] call FNC_GetPos;
_cnt = count (nearestObjects [_pos, DZE_maintainClasses, DZE_checkNearbyRadius]); 
if (_cnt >= DZE_BuildingLimit) exitWith {
	DZE_ActionInProgress = false;
	cutText ["Cannot build, too many objects within 120m.", "PLAIN DOWN"];
};
_cnt
