canbuild = false;
inSafeZone = true;
isInTraderCity = true;
if (!isNil "timer30") then { terminate timer30; };
if (!isNil "SafezoneFiredEvent2") then { player removeEventHandler ["Fired", SafezoneFiredEvent2]; };

hintSilent parseText format ["
	<t align='center' color='#37AAE1' shadow='2' size='1.75'>SAFEZONE</t><br/>
	<img size='5' image='GG\images\logo.paa'/>
	<br/>
	<t align='center' color='#868686'>------------------------------</t><br/>
	<br/>
	<t align='center' color='#52bf90'>You have entered a safezone, You have god mode but your weapons are disabled</t><br/>
	<t align='center' color='#52bf90'>Your vehicle's speed is limited, and your vehicle is protected from thiefs</t><br/>
	<br/>
	<t align='center' color='#FF0000'>Vehicles left in traders will be deleted after restart!!</t>
	<br/>
"];

PVDZE_send = [player,'SafeZoneState',[1]];
publicVariableServer 'PVDZE_send';
fnc_usec_damageHandler = {};
player_zombieCheck = {};
player allowDamage false;
player removeAllEventhandlers "handleDamage";
player addEventhandler ["handleDamage", {false}];

if ((getPlayerUID player) in (PV_NormalLevel_List+PV_SuperLevel_List)) then { 
	systemChat "Vehicle Theft Protection disabled for admins"
};

SafezoneFiredEvent = player addEventHandler ["Fired", {
	cutText ['You can not fire in a SafeZone!','WHITE IN'];
	NearestObject [_this select 0,_this select 4] setPos [0,0,0];
}];

SafezoneSkinChange = [] spawn {
	_skin = typeOf player;
	waitUntil {sleep 1; typeOf player != _skin};
	terminate SafezoneVehicleSpeedLimit;
	terminate SafezoneZSHIELD;
	terminate SafezoneTheft;
	terminate SafezoneVechicles;
	terminate SafezoneGuns;
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
			if (_countNear > _countNearFriends && !isNull findDisplay 106 && !((getPlayerUID player) in (PV_NormalLevel_List+PV_SuperLevel_List))) then {
				(findDisplay 106) closedisplay 0;
				closeDialog 0;closeDialog 0;closeDialog 0;
				cutText [format['%1, You are near another player, cannot access gear.',name player],'PLAIN'];
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
		if (_countNear > _countNearMine && !isNull findDisplay 106 && !((getPlayerUID player) in (PV_NormalLevel_List+PV_SuperLevel_List))) then {
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
		player_veh removeAllEventHandlers "handleDamage";
		player_veh addEventHandler ["handleDamage", {false}];
		player_veh allowDamage false;
		fnc_usec_damageVehicle ={};
		vehicle_handleDamage ={};
		vehicle_handleKilled ={};
		
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
			if !((player in _ownerGroup || _playerID in _ownerGroupTag) && !((getPlayerUID player) in (PV_NormalLevel_List+PV_SuperLevel_List))) then {
				cutText [format['%1, You are in a vehicle owned by another player',name player],'WHITE IN'];
				player action ['getOut', player_veh];
			};
		};
	uiSleep 0.25;
	};
};

SafezoneGuns = [] spawn {
	while {true} do {
		waitUntil {uiSleep 0.25; vehicle player == player};
		_notInSafeZone =
		[
			'MAAWS','RPG7V','M136','RPG18','STINGER',
			'MeleeHatchet_DZE','MeleeHatchet','MeleeCrowbar','MeleeMachete','MeleeFishingPole','MeleeSledge',
			'MeleeBaseBallBatNails','MeleeBaseBallBatBarbed','MeleeBaseBallBat'
		];
		_cwep = currentWeapon player;
		if (_cwep in _notInSafeZone) then
		{
			_swep = '';
			{
				if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
				{
					_swep = _x;
				};
			} forEach (weapons player);
			if (_swep == '') then
			{
				player playActionNow 'PutDown';
				_iPos = getPosATL player;
				_radius = 1;
				_removed = ([player,_cwep,1] call BIS_fnc_invRemove);
				if (_removed == 1) then
				{
					_item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
					_item addWeaponCargoGlobal [_cwep,1];
				};
			}
			else
			{
				player selectweapon _swep;
			};
		};
		uiSleep 0.1;
	};
};