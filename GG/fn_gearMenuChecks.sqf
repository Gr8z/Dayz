private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
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
if ((!canbuild || inSafeZone) and _cTarget isKindOf "Man" and alive _cTarget and (((vehicle player) distance _cTarget) < 12) && {group _cTarget != group player}) then {
	cutText ["Cannot access other players gear in the safezone." , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if (!canbuild) then {
	private ["_don_iscar","_don_ismycar","_don_crew"];
	_don_iscar = false; _don_ismycar = false;
	if (_cTarget isKindOf "LandVehicle" || _cTarget isKindOf "Air" || _cTarget isKindOf "Ship" ) then {
		_don_crew = _cTarget getVariable ["don_crew", nil]; if (isNil "_don_crew") then {_don_crew = [getPlayerUID player];};
		_don_iscar = true; if ((getPlayerUID player) in _don_crew) then {_don_ismycar = true;};
	};
	if (_don_iscar && !_don_ismycar) then {
		cutText ["You can't access this vehicle gear!" , "PLAIN DOWN"];
		_display closeDisplay 1;
	};
};