private ["_unit","_dragee","_unconscious"];
_dragee	= _this select 3;
_unit  	= player;
_unconscious = 	_dragee getVariable ["NORRN_unconscious", false];

if (isNull _dragee) exitWith {}; 
if (!_unconscious) exitWith {}; 
if (!canbuild) exitWith {};
_dragee setVariable ["NORRN_unit_dragged", true, true]; 
_unit playActionNow "grabDrag";
sleep 2;


norrnRaDrag = [_dragee];
publicVariable "norrnRaDrag";
_dragee attachto [_unit,[0.1, 1.01, 0]];
sleep 0.02;
norrnR180 = _dragee;
publicVariable "norrnR180";
_dragee  setDir 180;
r_drag_sqf 	= true;
call fnc_usec_medic_removeActions;

NORRN_dropAction = player addAction ["Drop body", "GG\medical\drop_body.sqf",_dragee, 0, false, true];
sleep 1;