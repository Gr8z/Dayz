private ["_item","_player","_pice","_type","_clientID","_playerUID","_query"];

//PVDZE_sellItem = [_item, player, userprice, _type];
_item =		_this select 0;
_player =	_this select 1;
_pice = 	_this select 2;
_type =		_this select 3;
_clientID = 	owner _player;
_playerUID = 	getPlayerUID _player;

if (_item == "") then {

	diag_log "No Item Selected";
	PVDZE_sellItemResult = false;
	
} else {

	_query = format["INSERT INTO store (PlayerUID, Classname, price, type) VALUES ('%1', '%2', '%3', '%4')",_playerUID,_item,_pice,_type];
	[_query, 1, true] call fn_asyncCall;
	PVDZE_sellItemResult = true;
	
};
if(!isNull _player) then {
	_clientID publicVariableClient "PVDZE_sellItemResult";
};

