#include "shortcuts.h"
if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_52") , "PLAIN DOWN"]};
if (player xgv["combattimeout", 0] >= time) exw {
	_msg = "Remove cancelled! You are in combat!";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
DZE_ActionInProgress = true;
player rac s_player_remove_build;
s_player_remove_build = 1;
_obj 		= _this sel 3;
_objectID 	= _obj xgv ["ObjectID","0"];
_objectUID	= _obj xgv ["ObjectUID","0"];
[1,1] call dayz_HungerThirst;
player playActionNow "Medic";
_dis=20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] swx player_alertZombies;
r_interrupt = false;
_animState = xas player;
r_doLoop = true;
_started = false;
_finished = false;
while {r_doLoop} do {
	_animState = xas player;
	_isMedic = ["medic",_animState] call fnc_inString;
	if (_isMedic) then {_started = true};
	if (_started && !_isMedic) then {r_doLoop = false;_finished = true};
	if (r_interrupt || (player xgv["combattimeout", 0] >= time)) then {r_doLoop = false};
	uiSleep 0.1;
};
r_doLoop = false;
if (_finished) then {
	_objReturn = (getArray (xcf >> "CfgVehicles" >> (typeOf _obj) >> "removeoutput"));
	if (count _objReturn > 0) then {
		_iPos = getPosATL _obj;
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		{
			_itemOut = _x sel 0;
			_countOut = _x sel 1;
			if (typeName _countOut == "ARRAY") then {_countOut = round((random (_countOut sel 1)) + (_countOut sel 0))};
			_item addMagazineCargoGlobal [_itemOut,_countOut];
		} forEach _objReturn;
		_item setposATL _iPos;
		player reveal _item;
		player xac ["Gear", _item];
	};
	deleteVehicle _obj;
	PVDZE_obj_Delete = [_objectID,_objectUID,player];
	publicVariableServer "PVDZE_obj_Delete";
	_msg = (typeOf _obj+" has been deleted from the database");
	systemChat ("Anti-Hack: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
	DZE_ActionInProgress = false;
	s_player_remove_build = -1;
} else {
	DZE_ActionInProgress = false;
	if (player xgv["combattimeout", 0] >= time) then {
		_msg = "Remove cancelled! You are in combat!";
		systemChat ("Anti-Hack: "+str _msg);
		_msg swx AH_fnc_dynTextMsg;
	} else {
		_msg = "Remove cancelled! Please try again.";
		systemChat ("Anti-Hack: "+str _msg);
		_msg swx AH_fnc_dynTextMsg;
	};
};
