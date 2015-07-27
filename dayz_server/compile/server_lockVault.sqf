private ["_objectID","_objectUID","_holder","_player","_inventory","_key"];

_objectID = _this select 0;
_objectUID = _this select 1;
_holder = _this select 2;
_player = _this select 3;
_inventory = _this select 4;
_inventoryCHK = _this select 5;

if (_inventoryCHK) then {
	diag_log format["Looks like a player tried to safe dupe! %1 (%2). Pos: %3", name _player, getPlayerUID _player, mapGridPosition (getPos _player)];
};

_holder setVariable ["WeaponCargo", _inventory select 0];
_holder setVariable ["MagazineCargo", _inventory select 1];
_holder setVariable ["BackpackCargo", _inventory select 2];
// _holder setVariable ["safebank",_inventory select 3];

if (_objectID == "0") then {
	_key = format["CHILD:309:%1:%2:",_objectUID,_inventory];
} else {
	_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
};
//diag_log ("HIVE: WRITE: "+ str(_key));
_key call server_hiveWrite;
diag_log format["SAFE LOCKED: ID:%1 UID:%2 BY %3(%4)", _objectID, _objectUID, (name _player), (getPlayerUID _player)];