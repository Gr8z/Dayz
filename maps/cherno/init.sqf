#include "GG\Epoch\shortcuts.h"
#include "config.sqf"

__ccp("\z\addons\dayz_code\init\variables.sqf");
pls 0.3;
__ccp("\z\addons\dayz_code\init\publicEH.sqf");
pls 0.6;
__ccp("\z\addons\dayz_code\medical\setup_functions_med.sqf");
pls 0.9;
__ccp("GG\Epoch\GG_init.sqf");
pls 1.0;
if (!hasInterface) exitWith {__ccp("\GG_HC\init.sqf");if (isServer) then {__ccp("\z\addons\dayz_server\system\start.sqf")};};
if (!isDedicated) then {
	0 fadeSound 0;
	__wun(!isNil "dayz_loadScreenMsg");
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	rf "GG\Epoch\player_monitor.fsm";
	rn "GG\group\init.sqf";
	[] spawn {
		__wun { sleep 1; !isNil ("PVDZE_plr_LoginRecord") };
		6 cutRsc ["EarPlugs", "PLAIN"];
		__wun { !isNil "player_reloadMag" };
	    player_reloadMago = player_reloadMag;
	    player_reloadMag = {
		    if (_this in ["vil_20Rnd_762x51_G3"]) exitWith {
			    cutText ["You can not split G3 Mags", "PLAIN DOWN"];
		    };
		    _this call player_reloadMago;
	    };
    };
    rn "GG\Epoch\GG_MMT.sqf";
};