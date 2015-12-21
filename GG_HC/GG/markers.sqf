#define aeh addEventHandler
#define dd dami
#define pls progressLoadingScreen
#define pns profileNamespace
#define reh removeAllEventHandlers
#define rf execFSM
#define rn execVM
#define rr respown
#define sdu setVectorDirAndUp
#define sel select
#define xcm compile
#define xcc call compile
#define xct createMarker
#define xgv getVariable
#define xlx preprocessFileLineNumbers
#define xsv setVariable
#define _cu Al
#define _te lM
#define _co is
#define _de si
#define _th on
#define _ief objects
#define _se _cu##_te##_co##_de##_th##_ief
#define __sm(ma) setMarker##ma
#define __CC(RAV) call dd##rr
#define __ccp(elif) xcc xlx elif
#define __wun(cond) waitUntil {cond}
#define __reh(ehn,ind) player removeEventHandler [#ehn,ind]
#define xmi animate
#define xac action
#define xaa addAction
#define exw exitWith
#define cdg closeDialog
#define cdx createDialog
#define swx spawn
#define gpd getPlayerUID
#define izn isNull
#define iko isKindOf
#define xtr terminate
#define xgn getNumber
#define xcf configFile
#define xas animationState
#define rac removeAction
#define lzl localize
#define fmt format
#define goodluckandgoodjobstealingmycode "urafaget"
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
_marker = xct ["RectangleBorder1", [10000,25350]];
_marker __sm(shape) "RECTANGLE";
_marker __sm(size) [10000,10000];
_marker __sm(Color) "ColorBlack";

_marker = xct ["RectangleBorder2", [-10000,5550]];
_marker __sm(shape) "RECTANGLE";
_marker __sm(size) [10000,30000];
_marker __sm(Color) "ColorBlack";

_marker = xct ["PetrolTraders", [5000,16100]];
[_marker," <These icons mark petrol traders","ColorBlack","mil_flag",[0.7,0.7],0.8] call _addMarker;

_marker = xct ["NoBuildAreas", [5000,15900]];
[_marker," Brown circles = No build areas","ColorBrown","Mil_Dot",[0.7,0.7],0.8] call _addMarker;

_marker = xct ["SafezoneAreas", [5000,15700]];
[_marker," Green circles = Safezones","ColorGreen","Mil_Dot",[0.7,0.7],0.8] call _addMarker;

_marker = xct ["HelpInfo", [5000,15500]];
[_marker," Type !help for a list of commands","ColorBlack","Mil_Dot",[0.7,0.7],0.8] call _addMarker;

{
	private ["_pos","_dis","_loc","_rng"];
	_pos = _x sel 0;
	_dis = (_x sel 1) sel 0;
	_diz = (_x sel 1) sel 1;
	_loc = _x sel 2;
	_clr = _x sel 3;
	
	if !(_loc in [""]) then {
		if ((_diz > 0)&&(_clr != "")) then {
			_mark = xct [_loc,_pos];
			_mark __sm(Brush) 'SolidBorder';
			_mark __sm(Color) 'ColorBrown';
			_mark __sm(Shape) 'ELLIPSE';
			_mark __sm(Alpha) 0.4;
			_mark __sm(Size) [_diz,_diz];
		};
		
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

{
	_marker = xct ["Gas"+str _forEachIndex, _x];
	_marker __sm(Type) "mil_flag";
	_marker __sm(Size) [0.75,0.75];
	_marker __sm(Alpha) 0.8;
} forEach [
	[12982, 10082],
	[13372, 6612],
	[9498, 1997],
	[6694, 3006],
	[2018, 2234],
	[5852, 2203],
	[10440, 8880],
	[5852, 10105],
	[3659, 8982],
	[3003, 7464],
	[2695, 5588],
	[4729, 6385],
	[7264, 7654],
	[10159, 5309],
	[10731, 10783]
];