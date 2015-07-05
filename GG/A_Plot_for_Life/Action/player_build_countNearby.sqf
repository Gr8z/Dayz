// disallow building if too many objects are found within 30m (by default)
private ["_cnt","_pos"];

if (getPlayerUID player in BuildDonor) then { DZE_BuildingLimit = 300;} else {DZE_BuildingLimit = 150; };
_pos = [player] call FNC_GetPos;
_cnt = count (_pos nearObjects [DZE_maintainClasses,DZE_checkNearbyRadius]); 
if (_cnt >= DZE_BuildingLimit) exitWith { //end script if too many objects nearby
	DZE_ActionInProgress = false;
	cutText ["Cannot build, too many objects within 45m.", "PLAIN DOWN"];
};
_cnt //returns amount of total objects found nearby
