private ["_index","_veh","_vehicle","_key","_stored","_maxstorage","_vehname"];
_index = _this select 0;
if (_index < 0) exitWith {
	_msg = "No vehicle selected, please select a vehicle.";
	systemChat ("(ArmA-AH): "+str _msg);
};

_stored = VirtualGarage getVariable ["StoredVehicles",[]];
_maxstorage = 10;
if ((count _stored) >= _maxstorage) exitWith {
	_msg = "Cannot store anymore vehicles, your garage is full!";
	systemChat ("(ArmA-AH): "+str _msg);
};

_veh = VehNearbyList select _index;
_vehicle = _veh select 0;
_key = _veh select 1;
_vehname = getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName");

if (_key == "") exitWith {
	_msg = "You can only store lockable vehicles.";
	systemChat ("(ArmA-AH): "+str _msg);
};

if !(_key in weapons player) exitWith {
	_msg = "You do not have the key for this vehicle!";
	systemChat ("(ArmA-AH): "+str _msg);
};

player removeWeapon _key;

PVDZE_veh_store = [player,_vehicle,VirtualGarage];
publicVariableServer "PVDZE_veh_store";

_msg = format["Stored your %1, %2 has been removed from your toolbelt.",_vehname,getText(configFile >> "CfgWeapons" >> _key >> "displayName")];
systemChat ("(ArmA-AH): "+str _msg);

sleep 2;
call garage_getnearVeh;
call garage_getstoredVeh;
