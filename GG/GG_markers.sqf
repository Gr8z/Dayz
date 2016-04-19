#include "shortcuts.h"
_addMarker = {
	_ehm1 = _this sel 0;
	_ehm2 = _this sel 1;
	_ehm3 = _this sel 2;
	_ehm4 = _this sel 3;
	
	_ehm1 __sm(Type) _ehm4;
	if (_ehm2 != "") then {_ehm1 __sm(Text) _ehm2};
	if (_ehm3 != "") then {_ehm1 __sm(Color) _ehm3};
	if (count _this > 4) then {
		_ehm5 = _this sel 4;
		_ehm1 __sm(Size) _ehm5;
		if (count _this > 5) then {
			_ehm6 = _this sel 5;
			_ehm1 __sm(Alpha) _ehm6;
		};
	};
};


//Tavi
if (dayZ_instance == 1) then {
	_marker = xct ["PetrolTraders", [17512,2000]];
	[_marker," WWW.GHOSTZGAMERZ.COM","ColorBlack","mil_flag",[0.7,0.7],0.8] call _addMarker;

	_marker = xct ["SafezoneAreas", [17512,1400]];
	[_marker," TS.GHOSTZGAMERZ.COM","ColorBlack","mil_flag",[0.7,0.7],0.8] call _addMarker;

	_marker = xct ["HelpInfo", [17512,800]];
	[_marker," Type !help for a list of commands","ColorGreen","Mil_Dot",[0.7,0.7],0.8] call _addMarker;
};

//cherno
if (dayZ_instance == 2) then {
	_marker = xct ["RectangleBorder1", [10000,25350]];
	_marker __sm(shape) "RECTANGLE";
	_marker __sm(size) [10000,10000];
	_marker __sm(Color) "ColorBlack";

	_marker = xct ["RectangleBorder2", [-10000,5550]];
	_marker __sm(shape) "RECTANGLE";
	_marker __sm(size) [10000,30000];
	_marker __sm(Color) "ColorBlack";

	_marker = xct ["PetrolTraders", [5000,15900]];
	[_marker," WWW.GHOSTZGAMERZ.COM","ColorBlack","mil_flag",[0.7,0.7],0.8] call _addMarker;

	_marker = xct ["SafezoneAreas", [5000,15700]];
	[_marker," TS.GHOSTZGAMERZ.COM","ColorGreen","mil_flag",[0.7,0.7],0.8] call _addMarker;

	_marker = xct ["HelpInfo", [5000,15500]];
	[_marker," Type !help for a list of commands","ColorBlack","Mil_Dot",[0.7,0.7],0.8] call _addMarker;
};

//Napf
if (dayZ_instance == 3) then {
	_marker = xct ["PetrolTraders", [5000,9900]];
	[_marker," WWW.GHOSTZGAMERZ.COM","ColorBlack","mil_flag",[0.7,0.7],0.8] call _addMarker;

	_marker = xct ["SafezoneAreas", [5000,9700]];
	[_marker," TS.GHOSTZGAMERZ.COM","ColorGreen","mil_flag",[0.7,0.7],0.8] call _addMarker;

	_marker = xct ["HelpInfo", [5000,9500]];
	[_marker," Type !help for a list of commands","ColorBlack","Mil_Dot",[0.7,0.7],0.8] call _addMarker;
};

{
	private ["_pos","_dis","_loc","_rng"];
	_pos = _x sel 0;
	_dis = (_x sel 1) sel 0;
	_diz = (_x sel 1) sel 1;
	_loc = _x sel 2;
	_clr = _x sel 3;
	
	if !(_loc in [""]) then {
	
		if (_dis > 0) then {
			_mark = xct [_loc+" green",_pos];
			_mark __sm(Brush) 'SolidBorder';
			_mark __sm(Color) _clr;
			_mark __sm(Shape) 'ELLIPSE';
			_mark __sm(Alpha) 1;
			_mark __sm(Size) [_dis,_dis];
		};
	};
} forEach (DZE_nobuildarray);