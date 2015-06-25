canbuild = false;
inSafeZone = true;
isInTraderCity = true;
if (!isNil "timer60") then { terminate timer60; };


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
};

hintSilent parseText format ["
	<t align='center' color='#37AAE1' shadow='2' size='1.75'>SAFEZONE</t><br/>
	<img size='5' image='GG\images\logo.paa'/>
	<br/>
	<t align='center' color='#868686'>------------------------------</t><br/>
	<br/>
	<t align='center' color='#52bf90'>You have entered a safezone, You have god mode but your weapons are disabled</t><br/>
	<t align='center' color='#52bf90'>Your vehicle's speed is limited, and your vehicle is protected from thiefs</t><br/>
	<br/>
	<t align='center' color='#FF0000'>DO NOT cross safezone border more than 2 times!!</t>
	<br/>	
	<t align='center' color='#FF0000'>Vehicles left in traders will be deleted after restart!!</t>
	<br/>
"];

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
		_obj = vehicle player;
		waitUntil {_obj != player && !((_obj) isKindOf 'Air') && !((_obj) isKindOf 'Plane') && !((_obj) isKindOf 'Bicycle')};
		_speed = abs speed _obj;
		if ((_obj != player) && (_speed > 20)) then
		{
			_vel = velocity _obj;
			_x = 0.8;
			if (_speed > 50) then {_x = 0.1;};
			_velNew = [(_vel select 0) * _x, (_vel select 1) * _x,(_vel select 2) * _x];
			_obj SetVelocity _velNew;
		};
		uiSleep 0.1;
	};
};
