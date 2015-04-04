private ["_item","_player","_playerID","_clientID","_able","_query","_result","_return","_playerUID","_class","_price","_type","_query1","_query2"];

_item = 	_this select 1;
_player = 	_this select 0;
_playerID = getPlayerUID _player;
_clientID = 	owner _player;
_able = false;

_query = format["SELECT PlayerUID, Classname, price, type FROM store WHERE ID='%1'",_item];

_result = [_query, 2, true] call fn_asyncCall;

waitUntil{!isNil "_result"};

if (count _result == 1) then {

	_able = true;
	_return = _result select 0;

	_playerUID = 	_return select 0;
	_class = 		_return select 1;
	_price = 		_return select 2;
	_type = 		_return select 3;

	_query1 = format["DELETE FROM store WHERE ID='%1'",_item];

	[_query1, 1, true] call fn_asyncCall;
	
	diag_log format["Player %1 bought %2 for %3 from the auctionhouse!",_playerID,_class,_price];
	
	_query2 = format["INSERT INTO store_user (PlayerUID, price) VALUES ('%1', '%2')",_playerUID,_price];

	[_query2, 1, true] call fn_asyncCall;
};

PVDZE_buyItemResult = _able;
	
if(!isNull _player) then {
	_clientID publicVariableClient "PVDZE_buyItemResult";
};


