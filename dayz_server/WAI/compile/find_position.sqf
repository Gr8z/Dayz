if(isServer) then {
	private ["_position"];
	markerready = false;
	if(wai_static_mission_locs) exitWith {
	_position = wai_mission_locations call BIS_fnc_selectRandom;
	_position set [2, 0];
	_position
	};
};