	//IN OUT SAFEZONE CHECK
	don_incar = false;
	[] spawn {
		private ['_runOneTime','_inSafeZone','_don_player_veh','_don_veh_driver'];
		waitUntil {!(isNil 'inSafeZone')};
		_runOneTime = false;
		_inSafeZone = inSafeZone;
		fnc_usec_damageHandler_original = fnc_usec_damageHandler;
		player_zombieCheck_original = player_zombieCheck;
		fnc_usec_unconscious_original = fnc_usec_unconscious;
		while {true} do {
			waitUntil {uiSleep 0.5; str _inSafeZone != str inSafeZone || !_runOneTime};
			_inSafeZone = inSafeZone;
			if (_inSafeZone) then {
				player_zombieCheck = {};
				fnc_usec_unconscious = {};
				
				[] spawn {
					while {inSafeZone} do {
						fnc_usec_damageHandler = {};
						uiSleep 0.025;
					};
					fnc_usec_damageHandler = fnc_usec_damageHandler_original;
				};
			};
			if (!_inSafeZone && _runOneTime) then {
				player_zombieCheck = player_zombieCheck_original;
				fnc_usec_unconscious = fnc_usec_unconscious_original;
			};
			if (_inSafeZone && don_incar) then {
				_don_player_veh = don_player_veh;
				_don_veh_driver = driver _don_player_veh;
				if (player == _don_veh_driver) then {
					_don_player_veh removeAllEventHandlers "handleDamage";
					_don_player_veh removeAllEventHandlers 'Fired';
					_don_player_veh addEventHandler ['handleDamage',{0}];
					_don_player_veh addEventHandler ['Fired',{deleteVehicle (_this select 6);}];
					_don_player_veh setVariable ['don_owner', player, true];
				};
				
			};
			if (!_inSafeZone && don_incar && _runOneTime) then {
				_don_player_veh = don_player_veh;
				_don_veh_driver = driver _don_player_veh;			
				if (player == _don_veh_driver) then {
					_don_player_veh removeAllEventHandlers "handleDamage";
					_don_player_veh removeAllEventHandlers 'Fired';
					_don_player_veh addEventHandler ['handleDamage',{_this call vehicle_handleDamage;}];
					_don_player_veh setVariable ['don_owner', objNull, true];	
				};
			};
			_runOneTime = true;
		};
	};
	
	//IN OUT VEHICLE CHECK
	[] spawn {
		while {true} do {
			waitUntil {uiSleep 0.25; vehicle player != player};
			don_player_veh = vehicle player;
			don_player_veh_isAir = don_player_veh isKindOf "Air";
			don_incar = true;
			_don_player_driver = player == driver don_player_veh;
			_don_veh_owner = don_player_veh getVariable ['don_owner', objNull];
			if (inSafeZone) then {
				if (isNull _don_veh_owner) then {
					if (_don_player_driver) then {
						don_player_veh setVariable ['don_owner', player, true]; _don_veh_owner = player;
						don_player_veh removeAllEventHandlers "handleDamage";
						don_player_veh removeAllEventHandlers 'Fired';
						don_player_veh addEventHandler ['handleDamage',{0}];
						don_player_veh addEventHandler ['Fired',{deleteVehicle (_this select 6);}];
					} else {
						cutText [format['%1. No-owner vehicle. Enter in the driver/pilot position to own this vehicle.',name player],'PLAIN'];
						player action ['getOut', don_player_veh];
					};
				} else {
					_ownerGroup = units group _don_veh_owner;
					_ownerGroupTag = _don_veh_owner getVariable ["friendlies",[]];
					_playerID = player getVariable ["CharacterID","0"];
					if !(player in _ownerGroup || _playerID in _ownerGroupTag) then {
						player action ['getOut', don_player_veh];
					};
				};
			};
			if (!inSafeZone) then {
				if (!isNull _don_veh_owner && _don_player_driver) then {
					don_player_veh removeAllEventHandlers "handleDamage";
					don_player_veh removeAllEventHandlers 'Fired';
					don_player_veh addEventHandler ['handleDamage',{_this call vehicle_handleDamage;}];
					don_player_veh setVariable ['don_owner', objNull, true];
				};
			};
			waitUntil {uiSleep 0.25; vehicle player == player};
			don_incar = false;
			don_player_veh = nil;
		};
	};

	//ANTI STEAL
	[] spawn {
		while {true} do {
			_playerID = player getVariable ["CharacterID",0];
			if (inSafezone) then {
				if (!don_incar) then {
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
							cutText [format['%1. You is near a player from another group, cant access gear.',name player],'PLAIN'];
						};
					};
					//CHECK FOR VEHCILE GEAR ACCESS
					_arround = player nearEntities [['LandVehicle','Air','ship'],25];_near = [];
					{if (player distance _x < ((sizeOf typeOf _x)/2) + 3) then {_near = _near + [_x];};} forEach _arround;
					_countNear = count _near;
					_countNearMine = {
						_owner = _x getVariable ['don_owner',objNull];
						_owner in _friends || _playerID in (_owner getVariable ["friendlies",[]])
					} count _near;
					if (_countNear > _countNearMine && !isNull findDisplay 106) then {
						(findDisplay 106) closedisplay 0;
						closeDialog 0;closeDialog 0;closeDialog 0;
						cutText [format['%1. You is near other player vehicle, you cant access gear now.',name player],'PLAIN'];
					};
				};
			} else {
				uiSleep 2.5;
			};
			uiSleep 0.25;
		};
	};