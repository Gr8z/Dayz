private["_nul","_nil"];
HeroCoords = _this select 0;
HeroName = _this select 1;

_nul = createMarker ["HeroMarker", HeroCoords];
"HeroMarker" setMarkerColor "ColorBlue";
"HeroMarker" setMarkerShape "ELLIPSE";
"HeroMarker" setMarkerBrush "Grid";
"HeroMarker" setMarkerSize [350,350];
_nil = createMarker ["HeroDot", HeroCoords];
"HeroDot" setMarkerColor "ColorBlack";
"HeroDot" setMarkerType "Vehicle";
"HeroDot" setMarkerText HeroName;