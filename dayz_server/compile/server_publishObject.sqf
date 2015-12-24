private ["_class","_uid","_charID","_object","_worldspace","_key","_allowed"];
//[dayz_characterID,_tent,[_dir,_location],"TentStorage"]
_charID =		_this select 0;
_object = 		_this select 1;
_worldspace = 	_this select 2;
_class = 		_this select 3;

_allowed = [_object, "Server"] call check_publishobject;
if (!_allowed) exitWith {deleteVehicle _object};
_uid = _worldspace call dayz_objectUID2;
_worldspace set [0, (_worldspace select 0) call KK_fnc_floatToString];
_worldspace set [1, (_worldspace select 1) call KK_fnc_positionToString];
_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _charID, _worldspace, [], [], 0,_uid];
_key call server_hiveWrite;

_object setVariable ["lastUpdate",time];
_object setVariable ["ObjectUID", _uid,true];
if (typeOf _object in GG_indestructables) then {
	_object allowDamage false;
	_object addEventHandler ["HandleDamage", {false}];
}else{
	_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled}];
	_object addEventHandler ["HandleDamage", {_this call GG_bohandleDamage}];
};
_object enableSimulation false;
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];