canbuild = true;
inSafeZone = false;
isInTraderCity = false;

hintSilent parseText format ["
	<t align='center' color='#37AAE1' shadow='2' size='1.75'>SAFEZONE</t><br/>
	<img size='5' image='GG\images\logo.paa'/>
	<br/>
	<t align='center' color='#868686'>------------------------------</t><br/>
	<br/>
	<t align='center' color='#52bf90'>You have left a safezone!</t><br/>
	<br/>
	<t align='center' color='#FF0000'>Your Vehicle Protection is disabled. Your weapon will activate and god mode disable within 30 seconds!</t>
	<br/>
"];


terminate SafezoneVehicleSpeedLimit;
terminate SafezoneSkinChange;
terminate SafezoneZSHIELD;
terminate SafezoneTheft;
terminate SafezoneVechicles;
terminate SafezoneGuns;

if (vehicle player != player) then {
player_veh removeAllEventHandlers "handleDamage";
player_veh addEventHandler ["handleDamage", {_this select 2}];
player_veh allowDamage true;
player_veh setVariable ['owner', objNull, true]; // Remove Ownership
fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
};

PVDZE_send = [player,'SafeZoneState',[0]];
publicVariableServer 'PVDZE_send';

if (!isNil "timer30") then { terminate timer30; };

player removeEventHandler ["Fired", SafezoneFiredEvent];

if (vehicle player != player) then {
	// Remove Blanks from Vehicles
	player_veh removeEventHandler ["Fired", SafezoneVehicleFiredEvent];
};

timer30 = [] spawn {

	SafezoneFiredEvent2 = player addEventHandler ["Fired", {
		cutText ['Your weapon will activate within 30 seconds!','WHITE IN'];
		nearestObject [_this select 0,_this select 4] setPos [0,0,0];
	}];
	
	if (vehicle player != player) then {
		// Add Blanks again to Vehicles
		SafezoneVehicleFiredEvent2 = player_veh addEventHandler ["Fired", {
			cutText ['Your vehicle weapon will activate within 30 seconds!','WHITE IN'];
			nearestObject [_this select 0,_this select 4] setPos [0,0,0];
		}];
	};
	
	for "_x" from 1 to 30 do {
		if (_x >= 2) then {cutText [format ["PROTECTION ENDING IN %1s", 31-_x], "PLAIN DOWN"];};
		uiSleep 1;
	};
	
	if (!inSafeZone) then {
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		player allowDamage true;
		player removeAllEventHandlers "HandleDamage";
		player removeEventHandler ["Fired", SafezoneFiredEvent2];
		if (vehicle player != player) then {
			player removeEventHandler ["Fired", SafezoneVehicleFiredEvent2];
		};
		player addEventhandler ["HandleDamage",{_this call fnc_usec_damageHandler;} ];
		
		taskHint ["PROTECTION DISABLED", [1,(68/255),(68/255),1], "taskFailed"];
	};
};
