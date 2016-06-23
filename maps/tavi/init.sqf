#include "GG\shortcuts.h"
#include "GG\config.sqf"
#include "mapConfig.sqf"

EpochEvents = [
["any","any","any","any",10,"Building"],
["any","any","any","any",20,"Military"],
["any","any","any","any",30,"Treasure"],
["any","any","any","any",40,"Construction"],
["any","any","any","any",50,"SupplyItems"]];

__ccp("\z\addons\dayz_code\init\variables.sqf");
pls 0.3;
__ccp("\z\addons\dayz_code\init\publicEH.sqf");
pls 0.6;
__ccp("\z\addons\dayz_code\medical\setup_functions_med.sqf");
pls 0.9;
__ccp("GG\GG_init.sqf");
pls 1.0;
if (!hasInterface) exitWith {
__ccp("\GG_HC\init.sqf");
if (isServer) then {
__ccp("\z\addons\dayz_server\system\start.sqf");
rn "\z\addons\dayz_server\init\most_wanted.sqf";
	};
};
if (!isDedicated) then {
	0 fadeSound 0;
	__wun(!isNil "dayz_loadScreenMsg");
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	rf "GG\player_monitor.fsm";
	rn "GG\group\init.sqf";
	rn "GG\spawn\start.sqf";
	rn "GG\GG_Hud.sqf";
	rn "GG\GG_PTM.sqf";
	_nil = [] rn "GG\VehicleKeyChanger\VehicleKeyChanger_init.sqf";
	_nil = [] rn "GG\GG_RMF.sqf";
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
    "PlayerCheckDupe" addPublicVariableEventHandler {(_this select 1) call {[_this select 0,_this select 1,_this select 2] call Dupe_Check;}};
};