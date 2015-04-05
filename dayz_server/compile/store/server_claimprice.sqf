private ["_player","_clientID","_playerUID","_query","_result","_total","_query1"];

_player = 		_this select 0;
_clientID = 	owner _player;
_playerUID = getPlayerUID _player;


_query = format["SELECT price FROM store_user WHERE PlayerUID='%1'",_playerUID];

_result = [_query, 2, true] call fn_asyncCall;


waitUntil{!isNil "_result"};

_total = 0;

{
	_total = _total + (_x select 0);
} forEach _result;


_query1 = format["DELETE FROM store_user WHERE PlayerUID='%1'",_playerUID];

[_query1, 1, true] call fn_asyncCall;



PVDZE_claimmoneyResult = _total;
	
if(!isNull _player) then {
	_clientID publicVariableClient "PVDZE_claimmoneyResult";
};


