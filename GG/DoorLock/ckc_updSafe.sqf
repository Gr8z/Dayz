private ["_object","_weapon","_magazine","_backpack","_newCombo","_actual","_ownerID","_classname","_location","_dir","_tent"];
DZE_ActionInProgress = true;
_object = player getVariable ["CurrentSafe", objNull];
if (_object == objNull) exitWith {cutText ["Problem changing code", "PLAIN DOWN"]};
_location = _object getVariable["OEMPos", ""];
if (count _location < 1) exitWith {cutText ["Problem changing code", "PLAIN DOWN"]};
_weapon 	= getWeaponCargo _object;
_magazine 	= getMagazineCargo _object;
_backpack 	= getBackpackCargo _object;
_newCombo 	= dayz_combination;
_classname 	= "VaultStorageLocked";
_location	= _object getVariable ["OEMPos",(getposATL _object)];
_objectID 	= _object getVariable ["ObjectID","0"];
_objectUID 	= _object getVariable ["ObjectUID","0"];
_dir 		= getDir _object;
_vec 		= [(vectorDir _object),(vectorUp _object)];
_msg 		= "Your new code: "+str _newCombo;
systemChat ("Server: "+str _msg+"");
cutText [_msg,"PLAIN"];

PVDZE_obj_Delete = [_objectID,_objectUID,player];
publicVariableServer 'PVDZE_obj_Delete';

"<t font='Zeppelin33' align='right' color='#FF0000'>"+_msg+"</t>" call AH_fnc_dynTextMsg;

_tent = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
_tent setDir _dir;
_tent setVectorDirAndUp _vec;
_tent setPosATL _location;
player reveal _tent;

_tent setVariable ["WeaponCargo", _weapon ,true];
_tent setVariable ["MagazineCargo", _magazine ,true];
_tent setVariable ["BackpackCargo", _backpack,true];
_tent setVariable ["CharacterID", _newCombo, true];
_tent setVariable ['OEMPos',_location,true];
_tent setVariable ["packing",0];

PVDZE_obj_Publish = [_newCombo,_tent,[_dir,_location,_vec],'VaultStorageLocked'];
publicVariableServer  'PVDZE_obj_Publish';

sleep 1;
deletevehicle _object;
_tent spawn player_unlockVault;
DZE_ActionInProgress = false;