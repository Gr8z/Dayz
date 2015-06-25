canbuild = true;
inSafeZone = false;
isInTraderCity = false;

hintSilent parseText format ["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>** SAFE-ZONE **</t><br/>
	<t align='center' color='#52bf90'>------------------------------</t><br/>
	<br/>
	<t align='center' color='#52bf90'>You have left a safezone!</t><br/>
	<br/>
	<t align='center' color='#FF0000'>Your weapon will activate and god mode disable within 1 minute!</t>
	<br/>
"];

/*
	<img size='8' image='Scripts\safezone\sign.paa'/>
	<br/>
*/

terminate SafezoneVehicleSpeedLimit;
terminate SafezoneSkinChange;
terminate SafezoneZSHIELD;

if (!isNil "timer60") then { terminate timer60; };
player removeEventHandler ["Fired", SafezoneFiredEvent];
//if (!isNil "SafezoneFiredEvent2") then { player removeEventHandler ["Fired", SafezoneFiredEvent2]; };

timer60 = [] spawn {
	SafezoneFiredEvent2 = player addEventHandler ["Fired", {
		titleText ["Your weapon will activate within 1 minute!","PLAIN DOWN"]; titleFadeOut 4;
		nearestObject [_this select 0,_this select 4] setPos [0,0,0];
	}];
	
	uiSleep (30 + (random 30));
	
	if (!inSafeZone) then {
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		player allowDamage true;
		player removeAllEventHandlers "HandleDamage";
		player removeEventHandler ["Fired", SafezoneFiredEvent2];
		player addEventhandler ["HandleDamage",{_this call fnc_usec_damageHandler;} ];
		
		taskHint ["GOD MODE DISABLED!", [1,(68/255),(68/255),1], "taskFailed"];
		//titleText ["GOD MODE DISABLED!\nWEAPONS ACTIVATED!","PLAIN"];
	};
};
