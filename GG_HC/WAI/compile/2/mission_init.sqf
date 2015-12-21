private ["_mines","_difficulty","_mission","_type","_color","_dot","_position","_marker","_name"];
_position = _this select 0;
_difficulty = _this select 1;
_name		= _this select 2;
_type		= _this select 3;
_mines		= _this select 4;

_mission = count wai_mission_data2;
if (debug_mode) then {diag_log("WAI: Starting Mission number " + str(_mission + 1))};
wai_mission_data2 = wai_mission_data2 + [[0,_type,[]]];
if (wai_enable_minefield && _mines) then {
	call {
		if (_difficulty == "easy") 		exitWith {_mines = [_position,20,37,20] call minefield};
		if (_difficulty == "medium") 	exitWith {_mines = [_position,35,52,50] call minefield};
		if (_difficulty == "hard") 		exitWith {_mines = [_position,50,75,100] call minefield};
		if (_difficulty == "extreme") 	exitWith {_mines = [_position,60,90,150] call minefield};
	};
	wai_mission_data2 select _mission set [2, _mines];
};
_marker = "";
_dot 		= "";
_color		= "";
call {
	if (_difficulty == "easy")		exitWith {_color = "ColorGreen"};
	if (_difficulty == "medium")		exitWith {_color = "ColorYellow"};
	if (_difficulty == "hard")		exitWith {_color = "ColorRed"};
	if (_difficulty == "extreme") 	exitWith {_color = "ColorBlack"};
	_color = _difficulty;
};
call {
	if (_type == "mainhero")		exitWith {_name = "[B] " + _name};
	if (_type == "mainbandit")		exitWith {_name = "[H] " + _name};
	if (_type == "special")			exitWith {_name = "[S] " + _name};
};
[_position, _color, _name, _mission] spawn {
	private["_position","_color","_name","_running","_mission","_type","_marker","_dot"];
	_position	= _this select 0;
	_color 		= _this select 1;
	_name 		= _this select 2;
	_mission = _this select 3;
	_running = true;
	while {_running} do {
		_type	= (wai_mission_data2 select _mission) select 1;
		_marker 		= createMarker [_type + "2", _position];
		_marker 		setMarkerColor _color;
		_marker 		setMarkerShape "ELLIPSE";
		_marker 		setMarkerBrush "Grid";
		_marker 		setMarkerSize [200,200];
		_marker 		setMarkerText _name;
		
		_dot = createMarker [_type + "dot2", _position];
		_dot 			setMarkerColor "ColorBlack";
		_dot 			setMarkerType "mil_dot";
		_dot 			setMarkerText _name;
		_dot 			setMarkerSize [0.7,0.7];
		_dot 			setMarkerAlpha 0.8;
		uiSleep 10;
		deleteMarker 	_marker;
		deleteMarker 	_dot;
		_running = (typeName (wai_mission_data2 select _mission) == "ARRAY");
	};
};
if (debug_mode) then {diag_log("WAI: Mission Data: " + str(wai_mission_data2))};
markerready2 = true;
_mission