private["_run","_nul","_nil"];

diag_log text format ["[AI Missions]: Mission Marker Refresh Starting!"];

if (isNil "HeroCoords")then{HeroCoords = [0,0,0];};
if (isNil "BanditCoords")then{BanditCoords = [0,0,0];};

_run = true;
while {_run} do
{
    [25,5] call AIMissionSleep;
	if (!(getMarkerColor "HeroMarker" == "")) then {
		deleteMarker "HeroMarker";
		deleteMarker "HeroDot";
		_nul = createMarker ["HeroMarker", HeroCoords];
		"HeroMarker" setMarkerColor "ColorBlue";
		"HeroMarker" setMarkerShape "ELLIPSE";
		"HeroMarker" setMarkerBrush "Grid";
		"HeroMarker" setMarkerSize [350,350];
		_zap = createMarker ["HeroDot", HeroCoords];
		"HeroDot" setMarkerColor "ColorBlack";
		"HeroDot" setMarkerType "Vehicle";
		"HeroDot" setMarkerText HeroName;
	};
	if (!(getMarkerColor "BanditMarker" == "")) then {
		deleteMarker "BanditMarker";
		deleteMarker "BanditDot";
		_nil = createMarker ["BanditMarker", BanditCoords];
		"BanditMarker" setMarkerColor "ColorRed";
		"BanditMarker" setMarkerShape "ELLIPSE";
		"BanditMarker" setMarkerBrush "Grid";
		"BanditMarker" setMarkerSize [350,350];
		_zip = createMarker ["BanditDot", BanditCoords];
		"BanditDot" setMarkerColor "ColorBlack";
		"BanditDot" setMarkerType "Vehicle";
		"BanditDot" setMarkerText BanditName;
	};
};