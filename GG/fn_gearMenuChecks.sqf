private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
_friends = units group player;

if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} count ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if (isNil "inSafeZone") then {inSafeZone = false;};
if ((!canbuild || inSafeZone) and _cTarget isKindOf "Man" and alive _cTarget and (((vehicle player) distance _cTarget) < 12) && {_cTarget not in _friends}) then {
	cutText ["Cannot access other players gear in the safezone." , "PLAIN DOWN"];
	_display closeDisplay 1;
};