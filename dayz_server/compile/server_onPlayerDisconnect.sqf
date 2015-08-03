private ["_invehicle","_isplayernearby","_playerObj","_myGroup","_id","_playerUID","_playerName","_characterID","_timeout","_message","_magazines","_playerPos"];
_playerUID = _this select 0;
_playerName = _this select 1;
_playerObj = nil;
_playerPos = [];
{
if ((getPlayerUID _x) == _playerUID) exitWith {_playerObj = _x;};
} count playableUnits;

if (isNil "_playerObj") then {
diag_log format["nil player object attempting PV, :%1", _this];

// fall back to using PV for now so we have a better chance at finding the player
_playerObj = call compile format["PVDZE_player%1",_playerUID];
};

if (isNil "_playerObj") exitWith {
diag_log format["%1: nil player object, _this:%2", __FILE__, _this];
};

diag_log format["get: %1 (%2), sent: %3 (%4)",typeName (getPlayerUID _playerObj), getPlayerUID _playerObj, typeName _playerUID, _playerUID];

if (!isNull _playerObj) then {

_playerPos = getPosATL _playerObj;
_characterID = _playerObj getVariable ["CharacterID","0"];
_timeout = _playerObj getVariable["combattimeout",0];

_invehicle = false;

if (vehicle _playerObj != _playerObj) then {
if ((vehicle _playerObj) isKindOf "ParachuteBase") then {_playerObj setVariable["USEC_injured",true];_playerObj setVariable["USEC_BloodQty",1];};
_playerObj action ["eject", vehicle _playerObj];
_invehicle = true;
diag_log format["LOGOUT IN VEHICLE: %1 at location %2", _playerName,(getPosATL _playerObj)];
};

if ((_timeout - time) > 0) then {
		
		_playerObj setVariable["USEC_BloodQty",3000]; // blood level
		_playerObj setVariable["NORRN_unconscious",true, true]; // set unconcscious
		_playerObj setVariable["unconsciousTime",15,true]; // unconcscious time
		_playerObj setVariable["USEC_injured",true]; // bleeding
		#ifdef DZE_SERVER_DEBUG
		diag_log format["COMBAT LOGGED: %1 (%2)", _playerName,_timeout];
		#endif

		// Message whole server when player combat logs
		_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>PLAYER COMBAT LOGGED</t><br/><t align='center' color='#ffffff'>%1 possibly just combat logged and has had their blood set to 3000, they're now bleeding and unconscious for 15 seconds when they reconnect.</t>",_playerName];
		customRemoteMessage = ['hint', _hint];
		publicVariable "customRemoteMessage";
		};
diag_log format["DISCONNECT: %1 (%2) Object: %3, _characterID: %4 at loc %5", _playerName,_playerUID,_playerObj,_characterID, (getPosATL _playerObj)];


_id = [_playerUID,_characterID,2] spawn dayz_recordLogin;

if (alive _playerObj) then {

_isplayernearby = (DZE_BackpackGuard && !_invehicle && ({(isPlayer _x) && (alive _x)} count (_playerPos nearEntities ["AllVehicles", 5]) > 1));

// prevent saving more than 20 magazine items
_magazines = [(magazines _playerObj),20] call array_reduceSize;

[_playerObj,_magazines,true,true,_isplayernearby] call server_playerSync;

// remove player
_playerObj call dayz_removePlayerOnDisconnect;
} else {
//Update Vehicle
{
[_x,"gear"] call server_updateObject;
} count (nearestObjects [_playerPos, dayz_updateObjects, 10]);
};
};