Private ["_EH_Fired"]; 
 
titleText [format["Exiting Base. God Mode Off and Your weapons have been reactivated."],"PLAIN DOWN"]; titleFadeOut 4;
 
_thePlayer = player;

_thePlayer removeEventHandler ["Fired", _EH_Fired];
player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
_thePlayer addEventHandler ["handleDamage", {true}];
_thePlayer removeAllEventHandlers "handleDamage";
_thePlayer allowDamage true;