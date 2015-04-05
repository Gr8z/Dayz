private ["_player","_query","_key","_pipe","_result","_clientID","_playerUID"];

_player 	=	_this select 0;
_clientID 	= 	owner _player;
_playerUID 	= 	getPlayerUID _player;

	
_query = format["SELECT id, classname, price, type FROM store WHERE PlayerUID != '%1'",_playerUID];

_result = [_query, 2, true] call fn_asyncCall;

PVDZE_queryStoreResult = _result;


if(!isNull _player) then {
	_clientID publicVariableClient "PVDZE_queryStoreResult";
};

