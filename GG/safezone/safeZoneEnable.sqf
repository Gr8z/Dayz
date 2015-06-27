canbuild = false;
inSafeZone = true;
isInTraderCity = true;
if (!isNil "timer30") then { terminate timer30; };

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
	terminate SafezoneTheft;
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
		player_veh = vehicle player;
		waitUntil {player_veh != player && !((player_veh) isKindOf 'Air') && !((player_veh) isKindOf 'Plane') && !((player_veh) isKindOf 'Bicycle')};
		_speed = abs speed player_veh;
		if ((player_veh != player) && (_speed > 20)) then
		{
			_vel = velocity player_veh;
			_x = 0.8;
			if (_speed > 50) then {_x = 0.1;};
			_velNew = [(_vel select 0) * _x, (_vel select 1) * _x,(_vel select 2) * _x];
			player_veh SetVelocity _velNew;
		};
		uiSleep 0.1;
	};
};

SafezoneTheft = [] spawn {
	while {true} do {
		waitUntil {uiSleep 0.25; vehicle player == player};
		_playerID = player getVariable ["CharacterID",0];
		//GET PLAYER FRIENDS
		_friends = units group player;
		//CHECK FOR PLAYER GEAR ACCESS
		_near = [];
		{if (isPlayer _x && _x != player) then {_near = _near + [_x];};} forEach (player nearEntities ['CAManBase',4]);
		_countNear = count _near;
		if (_countNear > 0) then {
			_countNearFriends = {_x in _friends || _playerID in (_x getVariable ["friendlies",[]])} count _near;
			if (_countNear > _countNearFriends && !isNull findDisplay 106) then {
				(findDisplay 106) closedisplay 0;
				closeDialog 0;closeDialog 0;closeDialog 0;
				cutText [format['%1, You are near a player from another group, cannot access gear.',name player],'PLAIN'];
			};
		};
		//CHECK FOR VEHCILE GEAR ACCESS
		_arround = player nearEntities [['LandVehicle','Air','ship'],25];_near = [];
		{if (player distance _x < ((sizeOf typeOf _x)/2) + 3) then {_near = _near + [_x];};} forEach _arround;
		_countNear = count _near;
		_countNearMine = {
			_owner = _x getVariable ['owner',objNull];
			_owner in _friends || _playerID in (_owner getVariable ["friendlies",[]])
		} count _near;
		if (_countNear > _countNearMine && !isNull findDisplay 106) then {
			(findDisplay 106) closedisplay 0;
			closeDialog 0;closeDialog 0;closeDialog 0;
			cutText [format["%1. You are near other player's vehicle, you cannot access gear",name player],"PLAIN"];
		};
		uiSleep 0.25;
	};
};

SafezoneVechicles = [] spawn {
	while {true} do {
		waitUntil {uiSleep 0.25; vehicle player != player};
		player_veh = vehicle player;
		player_veh_isAir = player_veh isKindOf "Air";
		_player_driver = player == driver player_veh;
		_veh_owner = player_veh getVariable ['owner', objNull];
		if (isNull _veh_owner) then {
			if (_player_driver) then {
				player_veh setVariable ['owner', player, true]; _veh_owner = player;
			} else {
				cutText [format['%1, This is an abondoned vehicle. Enter in the driver/pilot seat to claim this vehicle.',name player],'PLAIN'];
				player action ['getOut', player_veh];
			};
		} else {
			_ownerGroup = units group _veh_owner;
			_ownerGroupTag = _veh_owner getVariable ["friendlies",[]];
			_playerID = player getVariable ["CharacterID","0"];
			if !(player in _ownerGroup || _playerID in _ownerGroupTag) then {
				player action ['getOut', player_veh];
			};
		};
	uiSleep 0.25;
	};
};