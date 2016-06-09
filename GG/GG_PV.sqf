#include "shortcuts.h"
private ["_obj","_msg","_origMat","_bag"];
_obj = _this sel 3;
_pos = _obj call AH_fnc_getPos;
player rac s_player_packOBJ;
s_player_packOBJ = -1;
if ((({isPlayer _x} count (nearestObjects [player, ["CAManBase"], 8])) - 1) > 0) exw {
	_msg = "You can't pack vehicles when a player is within 8m of you!";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (count(crew _obj) > 0) exw {
	_msg = "Unable to pack "+typeOf _obj+" because it currently has a passenger or driver!";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (((damage _obj) > 0.5) || !(canMove _obj)) exw {
	_msg = "This "+typeOf _obj+" is too damaged to pack.";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

_origMat = switch (typeOf _obj) do {
	case "MMT_Civ": {["PartGeneric"]};
	case "ATV_CZ_EP1": {["PartGeneric","PartEngine","PartWheel","PartWheel"]};
	case "CSJ_GyroC": {["PartVRotor","PartEngine","PartFueltank"]};
};
_item = createVehicle ["WeaponHolder", _pos, [], 1, "CAN_COLLIDE"];
[_item,_pos] call AH_fnc_setPos;
{_item addMagazineCargoGlobal [_x,1]} forEach _origMat;
player reveal _item;
player xac ["Gear", _item];
temp_clutter = createVehicle ["ClutterCutter_EP1",_pos,[], 1, "CAN_COLLIDE"];
cutText ["You have packed your "+typeOf _obj+".","PLAIN DOWN"];
_msg = "You have packed "+typeOf _obj+" for: "+str _origMat+". Look on the ground for your materials!";
systemChat ("Server: "+str _msg);
_msg swx AH_fnc_dynTextMsg;
deleteVehicle _obj;
uiSleep 10;
if (!isNil 'temp_clutter') then {if !(izn temp_clutter) then {deleteVehicle temp_clutter}};