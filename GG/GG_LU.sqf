private ["_action","_vehicle","_lock","_keyName"];

_action = _this select 3;
_vehicle = _action select 0;
_lock = _action select 1;
if (count _action > 2) then { _keyName = _action select 2; };
{_vehicle removeAction _x} forEach s_player_incarlockunlock;s_player_incarlockunlock = [];
s_player_inCarlockUnlock_crtl = -1;

if (_lock) then {
	_vehicle setVehicleLock "LOCKED";
	_vehicle setVariable ["LOG_disabled",true,true];
	PVDZE_veh_Lock = [_vehicle,true];
	publicVariable "PVDZE_veh_Lock";
	if (_keyName != "") then { cutText [ format ["%1 key used to lock vehicle", _keyName], "PLAIN DOWN"]; } else
	{ cutText [ format ["You have locked the vehicle", _keyName], "PLAIN DOWN"]; };
} else {
	_vehicle setVehicleLock "UNLOCKED";
	_vehicle setVariable ["LOG_disabled",false,true];
	PVDZE_veh_Lock = [_vehicle,false];
	publicVariable "PVDZE_veh_Lock";
	if (_keyName != "") then { cutText [ format ["%1 key used to unlock vehicle", _keyName], "PLAIN DOWN"]; } else
	{ cutText [ format ["You have unlocked the vehicle"], "PLAIN DOWN"]; };
};

s_player_inCarlockUnlock_crtl = -1;
player action ["lightOn", _vehicle];
[nil, _vehicle, rSAY, "carBeep", 20] call RE;
sleep 0.5;
player action ["lightOff", _vehicle];