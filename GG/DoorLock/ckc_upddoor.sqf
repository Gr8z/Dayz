_object = dayz_selectedDoor;
_newCombo = DZE_Lock_Door;
_object setVariable ["CharacterID",_newCombo,true];
_actual = _object getVariable ["CharacterID", "0"];
_classname = typeOf _object;
_location	= _object getVariable["OEMPos",(getposATL _object)];
_dir = getDir _object;
_vec = [(vectorDir _object),(vectorUp _object)];
_msg = "Your new code: "+str _actual;
systemChat ("(ArmA-AH): "+str _msg+"");
cutText [_msg,"PLAIN"];
"<t font='Zeppelin33' align='right' color='#FF0000'>"+_msg+"</t>" call AH_fnc_dynTextMsg;

_newobject = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
_newobject setDir _dir;
_newobject setVectorDirAndUp _vec;
_newobject setPosATL _location;
if (_classname in dami_indestructables) then {
	_newobject allowDamage false;
	_newobject addEventHandler ["HandleDamage", {false}];
	_newobject enableSimulation false
} else {_newobject addEventHandler ["HandleDamage", {_this call dami_bohandleDamage}]};
	
PVDZE_obj_Swap = [_actual,_newobject,[_dir,_location,_vec],_classname,_object,player];
publicVariableServer "PVDZE_obj_Swap";

player reveal _newobject;
dayz_selectedDoor = _newobject;