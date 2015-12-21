#include "cake.h"
_vehicle = vehicle player;
call r_player_removeGunActionz;
_action = _vehicle xaa ["Close Gunner","GG\Epoch\dami_SO2.sqf",_vehicle,2,false,true,"",""];
r_player_gunactions set [count r_player_gunactions,_action];
r_gunaction2 = true;
_vehicle xmi ["HideGun_01",0];
_vehicle xmi ["HideGun_02",0];
_vehicle xmi ["HideGun_03",0];
_vehicle xmi ["HideGun_04",0];
_vehicle xmi ["CloseCover1",0];
_vehicle xmi ["CloseCover2",0];
_vehicle xsv ["SUV_closed",false,true];
