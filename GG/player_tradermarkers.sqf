/*
Epoch Dynamic Traders my maca134
http://www.epochservers.com

Add
execVM "player_tradermarkers.sqf";
to init.sqf in the mission, inside the 

if (!isDedicated) then {
	...code...
	execVM "player_tradermarkers.sqf";
};

*/
private ["_i"];
_i = 0;
waitUntil { sleep 1; !isNil "PV_TraderMarkers" };
{
	private ["_marker"];
	_i = _i + 1;
	_marker = createMarkerLocal [format["TraderMarker%1", _i], (_x select 0)];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "mil_triangle";
	_marker setMarkerTextLocal (_x select 1);
	_marker setMarkerColorLocal (_x select 2);
	true
} count PV_TraderMarkers;
