#include "shortcuts.h"
if (inSafeZone) exw {
	_msg = "Safezone detected! Primary weapon deleted! Next time, help unconcious players or fuck off.";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
	player removeMagazines (primaryWeapon player);
	player removeWeapon (primaryWeapon player);
};
private ["_unit","_unconcious","_inVeh","_alive"];
call fnc_usec_medic_removeActions;
_unit = _this sel 3;
if ((_unit xgv ["NORRN_unconscious", false]) && !(vehicle player != player) && (alive _unit)) then {player xac ["Gear", _unit]};
