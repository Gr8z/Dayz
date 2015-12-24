#include "shortcuts.h"
_vehicle = vehicle player;
if (gunner _vehicle == player) then [{player xac ["moveToCargo",_vehicle,1]},{
	call r_player_removeGunActionz;
	_action = _vehicle xaa ["Open Gunner","GG\Epoch\GG_SO1.sqf",_vehicle,2,false,true,"",""];
	r_player_gunactions set [count r_player_gunactions,_action];
	r_gunaction2 = true;
}];
_vehicle xmi ["HideGun_01",1];
_vehicle xmi ["HideGun_02",1];
_vehicle xmi ["HideGun_03",1];
_vehicle xmi ["HideGun_04",1];
_vehicle xmi ["CloseCover1",1];
_vehicle xmi ["CloseCover2",1];
_vehicle xsv ["SUV_closed",true,true];
