private ["_invehicle","_isplayernearby","_playerObj","_myGroup","_id","_playerUID","_playerName","_characterID","_timeout","_message","_magazines","_playerPos"];
_playerUID = _this select 0;
_playerName = _this select 1;
_playerObj = nil;
_playerPos = [];
{if ((getPlayerUID _x) == _playerUID) exitWith {_playerObj = _x}} forEach playableUnits;
if (isNil "_playerObj") then {
	diag_log format["nil player object attempting PV, :%1", _this];
	_playerObj = call compile format["PVDZE_player%1",_playerUID];
};
if (isNil "_playerObj") exitWith {diag_log format["%1: nil player object, _this:%2", __FILE__, _this]};
if (!isNull _playerObj) then {
	_playerPos 		= getPosATL _playerObj;
	_characterID 	= _playerObj getVariable ["CharacterID","0"];
	_timeout 		= _playerObj getVariable["combattimeout",0];
	_invehicle 		= false;
	if (vehicle _playerObj != _playerObj) then {
		_playerObj action ["eject", vehicle _playerObj];
		_invehicle = true;
		diag_log format["LOGOUT IN VEHICLE: %1 at location %2", _playerName,(getPosATL _playerObj)];
	};
	if ((alive _playerObj)&&((_timeout - time) > 0)) then {
		_timeout = round (_timeout - time);
		_bldQty = _playerObj getVariable ["USEC_BloodQTY",12000];
		if (_bldQty > 5000) then {_playerObj setVariable["USEC_BloodQty",5000]};
		_gpsPOS = mapGridPosition (getPosATL _playerObj);
		CLOG_nearPlyr = "none";
		_nrplrs = [];
		{if (isPlayer _x) then {_nrplrs = _nrplrs + [_x]}} forEach (nearestObjects [getPos _playerObj,["CAManBase"],1000]);
		if (count _nrplrs > 1) then {
			_nearplayer = _nrplrs select 1;
			CLOG_nearPlyr = format ["%1 (%2M)",name _nearplayer,round(_playerObj distance _nearplayer)];
		};
		_msg = format["COMBAT LOGGED: %1! Combat timer: %2 Closest player: %3 Location: %4", _playerName,_timeout,CLOG_nearPlyr,_gpsPOS];
		diag_log (_msg);
		
		_hMSG = format ["<t align='center' color='#FF0000' shadow='2' size='1.75'>COMBAT LOGGED</t><br/><t align='center' color='#ffffff'>%1<br/>Combat timer: %2<br/>Closest player: %3</t>",_playerName,_timeout,CLOG_nearPlyr,_gpsPOS];
		[nil, nil, rspawn, [_hMSG], {hint parseText (_this select 0);}] call RE;
		
		"HitLog" callExtension format ["CLOG: %1 |DayZ Instance: %2|",_msg,dayz_instance];
		_stime = (servertime);
		_hours = floor(_stime/60/60);
		_minutes = floor(_stime/60) - (_hours*60);
		_log_menu = format ["COMBAT LOG: %1 combat logged! Combat timer: %2 Closest player: %3 Location: %4 @ UPT: "+str _hours+"h(s) "+str _minutes+"min(s)", _playerName,_timeout,CLOG_nearPlyr,_gpsPOS];
		PVOZ_hitlog = PVOZ_hitlog + [['     '+_log_menu,'','0','1','0','0',[]]];
	};
	_msg = format ['%1 DISCONNECTED',toUpper(_playerName)];
	[nil, nil, rspawn, [_msg], {systemChat (_this select 0);}] call RE;
	diag_log format["DISCONNECT: %1 (%2) Object: %3, _characterID: %4 at loc %5", _playerName,_playerUID,_playerObj,_characterID, (getPosATL _playerObj)];
	_id = [_playerUID,_characterID,2] spawn dayz_recordLogin;
	if (alive _playerObj) then {
		_isplayernearby = (DZE_BackpackGuard and !_invehicle and ({(isPlayer _x)&&(alive _x)} count (_playerPos nearEntities ["AllVehicles", 5]) > 1));
		_magazines = [(magazines _playerObj),20] call array_reduceSize;
		[_playerObj,_magazines,true,true,_isplayernearby] call server_playerSync;
		_playerObj call dayz_removePlayerOnDisconnect;
	} else {{[_x,"gear"] call server_updateObject} foreach (nearestObjects [_playerPos, dayz_updateObjects, 10])};
};
