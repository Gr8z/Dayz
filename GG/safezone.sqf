private ["_EH_Fired","_vehGodThread","_vehWepDisableThread","_aBpT","_aBpT2","_sLimit","_plyr","_timerThread"];
disableSerialization;	
//Initialize values as empty
p2sz_asC = 0; safezone = 0; 
_plyr = objNull;  _EH_Fired = 0; _EH_Dmg = 0;
_vehGodThread = 0; _vehWepDisableThread = 0;
_aBpT = 0; _aBpT2 = 0;
_sLimit = 0; _timerThread = 0;
waitUntil {!isNil "dayz_animalCheck"}; //wait for player to laod in

while {true} do {
	waitUntil {safezone == 1};
	/*---------------------------------------------------------------------------
	Player Entered SafeZone
		Enable SafeZone Protection
	---------------------------------------------------------------------------*/
	_plyr = player; // player object used for checks

	/* Player God Mode */
	if (p2sz_asC > 1) then{
		systemChat ("Antispam - Please wait before re-entering!");
	} else {
		p2sz_asC = p2sz_asC + 1; //player has entered safezone
		systemChat ("Entering Trader Area - God Mode Enabled");
		if (p2sz_asC > 1) then { systemChat ("Antispam - You must wait 30 seconds for god mode to become active again once you leave!");};
		_plyr setVariable ['ZombZInSafeZone', true];
		fnc_usec_damageHandler = { ZombZinSafeZone = 1; false };
		_plyr removeEventHandler ["HandleDamage",zzEhDmg];
		_EH_Dmg = _plyr addEventHandler ["handleDamage", { ZombZinSafeZone = 1; false}];
		_plyr allowDamage false;
	};

	/*Vehicle God Mode Thread */
	_vehGodThread = [] spawn {
		while {true} do {
			waitUntil {safezone == 1};
			waitUntil { player != vehicle player };
		    
		    szVehicle = vehicle player;
		    szVehicle removeAllEventHandlers "handleDamage";
		    szVehicle addEventHandler ["handleDamage", { ZombZInSafeZone = 1; false}];
		    
		    szVehicle allowDamage false;
		    fnc_usec_damageVehicle ={ZombZInSafeZone = 1; false};
		    vehicle_handleDamage ={ZombZInSafeZone = 1; false};
		    vehicle_handleKilled ={ZombZInSafeZone = 1; false};

		    szDisableVehGod = false;
			waitUntil {szDisableVehGod};

		    szVehicle removeAllEventHandlers "handleDamage";
		    szVehicle addEventHandler ["handleDamage", {_this select 2}];
		    szVehicle allowDamage true;

		    fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
		    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
		    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
		};
	};

	/* Player Weapon Firing */
	_EH_Fired = _plyr addEventHandler ["Fired", {
		systemChat ("You can not fire your weapon in a Trader City Area");
		NearestObject [_this select 0,_this select 4] setPos [0,0,0];
	}];

	/* Vehicle Weapon Firing Thread - End this Manually via setting szDisableVehFire to false*/
	_vehWepDisableThread = [] spawn {
		private ["_inVehicle","_inVehicleLast","_EH_Fired_Vehicle"];
		_inVehicle = objNull;
		_inVehicleLast = objNull;

		/* Disable Firing Vehicle Weapons */
		szDisableVehFire = true;

		while {szDisableVehFire} do
		{
			sleep 0.1;
			if ( !(isNull _inVehicle) && (vehicle player == player) ) then
			{
				_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicleLast = _inVehicle;
				_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicle = objNull;
			};
			
			if ( vehicle player != player && isNull _inVehicle ) then
			{
				systemChat ("No Firing Vehicle Guns Enabled");
				_inVehicle = vehicle player;
				_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
					systemChat ("You can not fire your vehicles weapon in a Trader City Area");
					NearestObject [_this select 0,_this select 4] setPos [0,0,0];
				}];
			};
		};

		/* Re-Enable Firing Vehicle Weapons */
		if (!(isNull _inVehicle)) then
		{
			systemChat ("No Firing Vehicle Guns Disabled");
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
		
		if (!(isNull _inVehicleLast)) then
		{
			systemChat ("No Firing Vehicle Guns Disabled");
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
	};
	
	/* Anti-Backpack Theft */
	p2sz_asC_lLat = objNull;	p2sz_asC_lLatCD = 5;
	_aBpT = [] spawn {
		private [ "_ct","_ip","_ia","_dis"] ;
		while {true} do
		{
			if (isNull p2sz_asC_lLat) then
			{
				waitUntil {!isNull cursorTarget};
				_ct = cursorTarget;
				_ip = isPlayer _ct;
				if ( _ip ) then { _ia = alive _ct; _dis = _ct distance player; } else { _ia = false; _dis = 1000; };
				
				if ( (_ip && _ia) && (_dis < 6.5) ) then
				{
					p2sz_asC_lLat = _ct;
				};
			} else {
				p2sz_asC_lLatCD = p2sz_asC_lLatCD - 1;
				if (p2sz_asC_lLatCD < 0) then { p2sz_asC_lLatCD = 5; p2sz_asC_lLat = objNull; };
				sleep 1;
			};
		};
	};

	_aBpT2 = [] spawn {
		private ["_to","_dis","_inchk","_ip","_ia","_skip","_ct","_iv","_lp","_inv","_ctOwnerID","_friendlies","_if"];
		_ctOwnerID = 0;
		while {true} do
		{
			_ct = cursorTarget;
			_skip = false;
			_if = false;

			if ( !isNull (_ct) ) then
			{
				_to = typeOf _ct;
				_dis = _ct distance player;
				_inchk = ["WeaponHolder","ReammoBox"];
				
				_lp = false;
				{
					if ( (_to isKindOf _x) && (_dis < 10)) then
					{
						_lp = true;
					};
				} forEach ( _inchk );

				_ip = isPlayer _ct;
				_ia = alive _ct;
				_iv = _ct isKindOf "AllVehicles";
				_inv = (vehicle player != player);
				
				if ( _ip ) then {
					_ctOwnerID = _ct getVariable["CharacterID","0"];
					_friendlies	= player getVariable ["friendlyTo",[]];
					if(_ctOwnerID in _friendlies) then {	
						_if = true;
					};
				};

				//Lootpile check
				if ( _lp ) then {_skip = true;};
				//Dead body check
				if ( !(_ia)) then {_skip = true;};
				//Vehicle check
				if ( _iv && (_dis < 10) && !(_ip)) then {_skip = true;};
				//In a vehicle check
				if (_inv) then { _skip = true; };
				//Is player friendly?
				if ( _if ) then { _skip = true; };
			};
			
			if( !isNull (FindDisplay 106) && !_skip ) then
			{
				if (isNull p2sz_asC_lLat) then
				{
					(findDisplay 106) closeDisplay 1;
					waitUntil { isNull (FindDisplay 106) };
					createGearDialog [(player), 'RscDisplayGear'];
					systemChat ("Anti Backpack Stealing - Redirecting you to your own gear!");
					waitUntil { isNull (FindDisplay 106) };
				} else {
					systemChat (format["You cannot open your gear at this time as you have looked at a player in the last 5 seconds."]);
					(findDisplay 106) closeDisplay 1;
					waitUntil { isNull (FindDisplay 106) };
				};
			};
			if (_skip && _if) then {
				systemChat ("This player is tagged friendly, you have access to this players bag");
				uiSleep 30;
			};
		};
	};

	/* Speed Limit */
	_sLimit = [] spawn 	{
		private ["_vehicle", "_curspeed","_nearPlayers", "_playerNearMaxSpeed", "_noPlayerNearMaxSpeed", "_maxSpeed", "_vel", "_dir", "_speed","_playerNear"];
		if (((vehicle player) != player) and (!((vehicle player) isKindOf 'Air'))) then	{
			systemChat ("Safezone 22-KMPH Speed Limit Enabled");
		}; 
		_playerNearMaxSpeed = 21.5; //Max speed with players within range
		_noPlayerNearMaxSpeed = 40;	//Max speed with 0 players within range
		_maxSpeed = 21.5;			_playerNear = false;			_nearPlayers = [];			_curspeed = 0;			_vel = [];			_dir = 0;			_speed = 0;
		while {safezone == 1} do 
		{
			waitUntil {(((vehicle player) != player) and (!((vehicle player) isKindOf 'Air')))};
			_vehicle = vehicle player;
			_nearPlayers = _vehicle nearEntities ["Man", 60];
			sleep 0.08;
			_playerNear = ({isPlayer _x && alive _x} count _nearPlayers) > 0;
			_curspeed = speed _vehicle;
			if (_playerNear) then { _maxspeed = _playerNearMaxSpeed; } else { _maxspeed = _noPlayerNearMaxSpeed; };
			if (_curspeed > _maxspeed) then
			{
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = _curspeed - _maxspeed;		
				_vehicle setVelocity [(_vel select 0)-(((sin _dir)*_speed)),(_vel select 1)- (((cos _dir)*_speed)),(_vel select 2)];
			};
			sleep 0.02;
		};
	};

	/* Change Clothes */
	player_wearClothes = 	{ ZombZinSafeZone = 1; systemChat ("Changing clothes is disabled in Safezone Trader Area"); false };
	/* Spawn Zeds */
	building_spawnZombies =	{ ZombZinSafeZone = 1; false };
	/*Spawn Loot */
	building_spawnLoot =	{ ZombZinSafeZone = 1; false };
	/*Zombie Attacks*/
	player_zombieCheck = 	{ ZombZinSafeZone = 1; false };


	waitUntil {safezone < 1};
	/*---------------------------------------------------------------------------
	Player Left SafeZone
		Start 30 second delayed protection disable
		Disable SpeedLimit
		Start Timer Thread
	---------------------------------------------------------------------------*/

	//Disable Anti-Backpack Stealing Scripts
	p2sz_asC_lLat = objNull;	p2sz_asC_lLatCD = 5;
	if (!isNil '_aBpT') then { terminate _aBpT; };
	if (!isNil '_aBpT2') then { terminate _aBpT2; };

	//Disable Speed Limit
	if (!isNil '_sLimit') then { terminate _sLimit };

	safezone = 2; //Change Status from out of safe-zone (0) to timer in progress

	systemChat ("Exiting Trader Area - Protection will remain enabled for 30 seconds!");

	//Start Timer Thread
	_timerThread = [] spawn { uiSleep 30; safezone = 0; };

	waitUntil {safezone < 2};
	/*---------------------------------------------------------------------------
	Player Re-Entered SafeZone  		OR  		 _timerThread ran out
		Disable SafeZone Protection
			- Terminate _vehWepDisableThread
			- set szDisableVehGod to true
		Kill Timer Thread
	---------------------------------------------------------------------------*/

	//Kill _timerThread thread
	if (!isNil '_timerThread') then { terminate _timerThread };	

	//Re-Enable These
	building_spawnZombies =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	building_spawnLoot = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnLoot.sqf";
	player_wearClothes =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_wearClothes.sqf";
	player_zombieCheck = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";	

	//Disable Vehicle GodMode
	szDisableVehGod = true;

	//Re-Enable vehicle weapons
	szDisableVehFire = false;

	//Re-Enable player weapons
	_plyr removeEventHandler["Fired", _EH_Fired];

	//Disable Player God Mode
	_plyr removeEventHandler ["handleDamage",_EH_Dmg];
	[player] call fnc_usec_damageHandle;
	_plyr allowDamage true;

	//reset var
	_plyr setVariable ['ZombZInSafeZone', false];

	//check if player has entered safezone twice recently
	if (p2sz_asC > 1) then {
		//antispam timer
		[] spawn {
			uiSleep 30;
			if (p2sz_asC > 1) then { p2sz_asC = p2sz_asC - 1; } else { p2sz_asC = 0; };
		};
	};
};