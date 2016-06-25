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
{player addMagazine [_x,1]} forEach _origMat;
cutText ["You have packed your "+typeOf _obj+".","PLAIN DOWN"];
_msg = "You have packed "+typeOf _obj+". Items: "+str _origMat+" have been added to your inventory.";
systemChat ("Server: "+str _msg);
_msg swx AH_fnc_dynTextMsg;
deleteVehicle _obj;
uiSleep 10;