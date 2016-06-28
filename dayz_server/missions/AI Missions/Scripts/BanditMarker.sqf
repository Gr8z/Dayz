private["_nul","_nil"];
BanditCoords = _this select 0;
BanditName = _this select 1;

_nul = createMarker ["BanditMarker", BanditCoords];
"BanditMarker" setMarkerColor "ColorRed";
"BanditMarker" setMarkerShape "ELLIPSE";
"BanditMarker" setMarkerBrush "Grid";
"BanditMarker" setMarkerSize [350,350];
_nil = createMarker ["BanditDot", BanditCoords];
"BanditDot" setMarkerColor "ColorBlack";
"BanditDot" setMarkerType "Vehicle";
"BanditDot" setMarkerText BanditName;