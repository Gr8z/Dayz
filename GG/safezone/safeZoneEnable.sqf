/*
if ((player getVariable["combattimeout",0]) > 0) exitWith {
	_worldPos = player modelToWorld [0, -20, 0];
	player setPos _worldPos;
	cutText ["You can not enter the safezone while in combat!!","PLAIN DOWN"];
};
*/
canbuild = false;
inSafeZone = true;
isInTraderCity = true;
if (!isNil "timer60") then { terminate timer60; };
//if (!isNil "SafezoneFiredEvent2") then { terminate SafezoneFiredEvent2; };

SafeZoneEnterCount = SafeZoneEnterCount + 1;
[] spawn { uiSleep 120; SafeZoneEnterCount = SafeZoneEnterCount - 1; };

if (SafeZoneEnterCount > 3) then {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [2];
	"dynamicBlur" ppEffectCommit 0;
	"colorCorrections" ppEffectEnable true;"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.1],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	[player,0.01] call fnc_usec_damageUnconscious;
	player setVariable ["NORRN_unconscious", true, true];
	r_player_timeout = 300;
	r_player_unconscious = true;
	player setVariable["medForceUpdate",true,true];
	player setVariable ["unconsciousTime", r_player_timeout, true];
	//titleText ["WARNING: 5 minute knock-out for abusing safezone!","PLAIN"];
};

hintSilent parseText format ["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>** SAFE-ZONE **</t><br/>
	<t align='center' color='#52bf90'>------------------------------</t><br/>
	<br/>
	<t align='center' color='#52bf90'>You have entered a safezone, godmode is enabled and your weapon deactivated!</t><br/>
	<br/>
	<t align='center' color='#FF0000'>DO NOT cross safezone border more than 2 times!!</t>
	<br/>
"];
/*
	<img size='8' image='Scripts\safezone\sign.paa'/>
	<br/>
*/

fnc_usec_damageHandler = {};
player_zombieCheck = {};
player allowDamage false;
player removeAllEventhandlers "handleDamage";
player addEventhandler ["handleDamage", {false}];

SafezoneFiredEvent = player addEventHandler ["Fired", {
	titleText ["You can not fire your weapon in a safezone.","PLAIN DOWN"]; titleFadeOut 4;
	NearestObject [_this select 0,_this select 4] setPos [0,0,0];
}];

SafezoneSkinChange = [] spawn {
	_skin = typeOf player;
	waitUntil {sleep 1; typeOf player != _skin};
	terminate SafezoneVehicleSpeedLimit;
	terminate SafezoneZSHIELD;
	call SafeZoneEnable;
};

SafezoneZSHIELD = [] spawn {
	while {true} do {
		_pos1 = getPos (vehicle player);
		_zombies = _pos1 nearEntities ["zZombie_Base",40];
		{deleteVehicle _x;} forEach _zombies;
		uiSleep 5;
	};
};

SafezoneVehicleSpeedLimit = [] spawn {
	while {true} do {
		waitUntil {vehicle player != player && !((vehicle player) isKindOf 'Air') && !((vehicle player) isKindOf 'Bicycle')};
		_vehicle = vehicle player;
		_curspeed = speed _vehicle;
		if (_curspeed > 18) then {
			_vel = velocity _vehicle;
			_dir = direction _vehicle;
			_speed = _curspeed - 18;
			_vehicle setVelocity [(_vel select 0)-((sin _dir)*_speed),(_vel select 1)- ((cos _dir)*_speed),(_vel select 2)];
		};
		uiSleep 0.1;
	};
};
