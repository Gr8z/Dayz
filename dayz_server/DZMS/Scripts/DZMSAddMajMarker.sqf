/*
	Adds a marker for Major Missions. Only runs once.
	DZMSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil"];
DZMSMajCoords = _this select 0;
DZMSMajName = _this select 1;

_nul = createMarker ["DZMSMajMarker", DZMSMajCoords];
"DZMSMajMarker" setMarkerColor "ColorRed";
"DZMSMajMarker" setMarkerShape "ELLIPSE";
"DZMSMajMarker" setMarkerBrush "Grid";
"DZMSMajMarker" setMarkerSize [350,350];
_nil = createMarker ["DZMSMajDot", DZMSMajCoords];
"DZMSMajDot" setMarkerColor "ColorBlack";
"DZMSMajDot" setMarkerType "Vehicle";
"DZMSMajDot" setMarkerText DZMSMajName;