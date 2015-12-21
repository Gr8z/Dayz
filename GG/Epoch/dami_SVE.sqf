#include "cake.h"
private ["_vehicle","_hitpoints","_damage","_part","_cmpt","_color","_percent","_string","_handle","_cancel"];

_vehicle = _this sel 3;
{dayz_myCursorTarget rac _x} count s_player_repairActions;
s_player_repairActions = [];
_hitpoints = switch (true) do {
	default {_vehicle call vehicle_getHitpoints};
	case ((_vehicle iko "Car") && !(_vehicle iko "Truck")): {["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitLFWheel","HitLBWheel","HitRFWheel","HitRBWheel","HitFuel","HitRGlass","HitLGlass","HitEngine"]};
	case (_vehicle iko "Truck"): {["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitGlass7","HitGlass8","HitLFWheel","HitLBWheel","HitRFWheel","HitRBWheel","HitLMWheel","HitRMWheel","HitFuel","HitRGlass","HitLGlass","HitEngine"]};
};
{
	_damage = [_vehicle,_x] call object_getHit;
	_part = "PartGeneric";
	_cmpt = toArray (_x);
	_cmpt set [0,20];
	_cmpt set [1,toArray ("-") sel 0];
	_cmpt set [2,20];
	_cmpt = toString _cmpt;
	_part = switch (true) do {
		default {"PartGeneric"};
		case (["Engine",_x,false] call fnc_inString): {"PartEngine"};
		case (["HRotor",_x,false] call fnc_inString): {"PartVRotor"};
		case (["Fuel",_x,false] call fnc_inString): {"PartFueltank"};
		case (["Wheel",_x,false] call fnc_inString): {"PartWheel"};
		case (["Glass",_x,false] call fnc_inString): {"PartGlass"};
	};
	if (_damage < 1 && _damage >= 0) then {
		if ((_part == "PartGlass") || (_part == "PartWheel")) then {
			_color = switch (true) do {
				default {"color='#ffff00'"};
				case (_damage >= 0.5): {"color='#ff8800'"};
				case (_damage >= 0.9): {"color='#ff0000'"};
			};
			_percent = round(_damage*100);
			_string = fmt["<t %2>Remove%1 (%3 %4)</t>",_cmpt,_color,_percent,"%"];
			_handle = dayz_myCursorTarget xaa [_string, "\z\addons\dayz_code\actions\salvage.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
			s_player_repairActions set [count s_player_repairActions,_handle];
		};
	};
} forEach _hitpoints;
if (count _hitpoints > 0) then {
	_cancel = dayz_myCursorTarget xaa [lzl "STR_EPOCH_PLAYER_CANCEL", "\z\addons\dayz_code\actions\repair_cancel.sqf","repair", 0, true, false, "",""];
	s_player_repairActions set [count s_player_repairActions,_cancel];
	s_player_repair_crtl = 1;
};
