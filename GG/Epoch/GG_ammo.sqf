#include "shortcuts.h"
_ammo = switch (true) do {
	default {["Unknown"]};
	case ((vehicle player) iko "AH6J_EP1_DZ") : {["4000Rnd_762x51_M134","2000Rnd_762x51_M134"]};
	case ((vehicle player) iko "pook_H13_gunship") : {["pook_1300Rnd_762x51_M60"]};
	case (((vehicle player) iko "Plane") && !(typeOf (vehicle player) in ["F35B","SU34","L39_TK_EP1"])) : {["100Rnd_762x51_M240"]};
	case (((vehicle player) iko "Plane") && (typeOf (vehicle player) in ["F35B","SU34","L39_TK_EP1"])) : {["50Rnd_127x107_DSHKM"]};
};
call r_player_removeActions2;{_part_out = _x;if (_part_out in (magazines player)) exw {(vehicle player) addMagazine _part_out;player removeMagazine _part_out;_msg = "Loaded 1 "+_part_out+" to your "+typeOf (vehicle player)+"!";systemChat ("(ArmA-AH): "+str _msg);cutText [_msg,"PLAIN DOWN"]};if !(_part_out in (magazines player)) then {_msg = "Missing "+_part_out+"!";systemChat ("(ArmA-AH): "+str _msg);cutText [_msg,"PLAIN DOWN"]}} forEach _ammo;
