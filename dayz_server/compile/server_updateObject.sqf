
/*[_object,_type] spawn server_updateObject; */

private ["_object","_type","_objectID","_uid","_lastUpdate","_needUpdate","_object_position","_object_inventory","_object_damage","_isNotOk","_parachuteWest","_firstTime","_object_killed","_object_repair","_isbuildable","_object_vehicleKey","_activatingPlayer","_vehicleClassname","_toKey","_toKeyName","_vehicle_ID","_vehicle_UID"];

_object = 	_this select 0;


if(isNull(_object)) exitWith {diag_log format["Skipping Null Object: %1", _object];};


_type = _this select 1;
_parachuteWest = ((typeOf _object == "ParachuteWest") || (typeOf _object == "ParachuteC"));
_isbuildable = (typeOf _object) in dayz_allowedObjects;
_isNotOk = false;
_firstTime = false;

_objectID =	_object getVariable ["ObjectID","0"];
_uid = 		_object getVariable ["ObjectUID","0"];

if ((typeName _objectID != "string") || (typeName _uid != "string")) then
{ 
    diag_log(format["Non-string Object: ID %1 UID %2", _objectID, _uid]); 


    _objectID = "0";
    _uid = "0";
};
if (!_parachuteWest && !(locked _object)) then {
	if (_objectID == "0" && _uid == "0") then {

		_object_position = getPosATL _object;
    	_isNotOk = true;
	};
};


if (_isNotOk && _isbuildable) exitWith {};


//if (_isNotOk) exitWith { deleteVehicle _object; diag_log(format["Deleting object %1 with invalid ID at pos [%2,%3,%4]",typeOf _object,_object_position select 0,_object_position select 1, _object_position select 2]); };


_lastUpdate = _object getVariable ["lastUpdate",time];
_needUpdate = _object in needUpdate_objects;


_object_position = {
	private["_position","_worldspace","_fuel","_key","_colour","_colour2"];
	_position = getPosATL _object;
	if (_object isKindOf "AllVehicles") then {
		_colour = _object getVariable ["Colour","0"];
		_colour2 = _object getVariable ["Colour2","0"];
		_worldspace = [
			round(direction _object),
			_position,
			_colour,
			_colour2
		];
		_fuel = fuel _object;
	} else {
		_worldspace = [
			round(direction _object),
			_position
		];
		_fuel = 0;
	};
		if (_object isKindOf "AllVehicles") then {
			_fuel = fuel _object;
		};
		_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
		//diag_log ("HIVE: WRITE: "+ str(_key));
		_key call server_hiveWrite;
};

		_object_inventory = {
			private["_inventory","_previous","_key"];
			_isNormal = true;
			if (typeOf (_object) == "Plastic_Pole_EP1_DZ") then{
				_isNormal = false;
				_inventory = _object getVariable ["plotfriends", []]; //We're replacing the inventory with UIDs for this item
			}; 
			if (typeOf (_object)in DZE_DoorsLocked) then{
				_isNormal = false;
				_inventory = _object getVariable ["doorfriends", []]; //We're replacing the inventory with UIDs for this item
			};

			if(_isNormal)then {
				_inventory = [

				getWeaponCargo _object,
				getMagazineCargo _object,
				getBackpackCargo _object
				];
			};


		_previous = str(_object getVariable["lastInventory",[]]);
		if (str(_inventory) != _previous) then {
			if(alive _object) then{
				_object setVariable["lastInventory",_inventory];
			};
			if (_objectID == "0") then {
				_key = format["CHILD:309:%1:%2:",_uid,_inventory];
			} else {
				_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
			};
			//diag_log ("HIVE: WRITE: "+ str(_key));
			_key call server_hiveWrite;
			};
		};

_object_damage = {
		private["_hitpoints","_array","_hit","_selection","_key","_damage"];
			
		_hitpoints = _object call vehicle_getHitpoints;
		_damage = damage _object;
		_array = [];
		{

			_hit = [_object,_x] call object_getHit;
			_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
			if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
			_object setHit ["_selection", _hit];
		} count _hitpoints;

		
		_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
		//diag_log ("HIVE: WRITE: "+ str(_key));
		_key call server_hiveWrite;
		_object setVariable ["needUpdate",false,true];
	};

_object_killed = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
	if(_object isKindOf "AllVehicles") then{
		_object execVM "\z\addons\dayz_server\compile\server_crashLoot.sqf";
	}; 
	_hitpoints = _object call vehicle_getHitpoints;
	//_damage = damage _object;
	_damage = 1;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_hit = 1;
		_object setHit ["_selection", _hit];
	} count _hitpoints;
	
	if (_objectID == "0") then {
		_key = format["CHILD:306:%1:%2:%3:",_uid,_array,_damage];
	} else {
		_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
	};
	//diag_log ("HIVE: WRITE: "+ str(_key));
	_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
	if ((count _this) > 2) then {
		_killer = _this select 2;
		_charID = _object getVariable ['CharacterID','0'];
		_objID 	= _object getVariable['ObjectID','0'];
		_objUID	= _object getVariable['ObjectUID','0'];
		_worldSpace = getPosATL _object;
		if (getPlayerUID _killer != "") then {
			_name = if (alive _killer) then { name _killer; } else { format["OBJECT %1", _killer]; };
			diag_log format["Vehicle killed: Vehicle %1 (TYPE: %2), CharacterID: %3, ObjectID: %4, ObjectUID: %5, Position: %6, Killer: %7 (UID: %8)", _object, (typeOf _object), _charID, _objID, _objUID, _worldSpace, _name, (getPlayerUID _killer)];
		} else {
			diag_log format["Vehicle killed: Vehicle %1 (TYPE: %2), CharacterID: %3, ObjectID: %4, ObjectUID: %5, Position: %6", _object, (typeOf _object), _charID, _objID, _objUID, _worldSpace];
		};
	};
};

_object_repair = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
	_hitpoints = _object call vehicle_getHitpoints;
	_damage = damage _object;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_object setHit ["_selection", _hit];
	} count _hitpoints;
	
	_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
	//diag_log ("HIVE: WRITE: "+ str(_key));
	_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
};

_object_vehicleKey = {
	private ["_hit","_selection","_fuel","_gotcha","_retry","_vehicleID","_key","_result","_outcome","_player","_class","_newKey","_newKeyName","_oldVehicleID","_oldVehicleUID","_hitpoints","_damage","_array","_inventory","_vehicleUID","_position","_dir","_worldspace"];
	
	/* Setting up variables */
	_player = _this select 0;
	_class = _this select 1;
	_newKey = _this select 2;
	_newKeyName = _this select 3;
	_oldVehicleID = _this select 4;
	_oldVehicleUID = _this select 5;

	/* Get Damage of the Vehicle */
	_hitpoints = _object call vehicle_getHitpoints;
	_damage = damage _object;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_object setHit ["_selection", _hit];
	} forEach _hitpoints;
	
	/* Get the Fuel of the Vehicle */
	_fuel = 0;
	if (_object isKindOf "AllVehicles") then {
		_fuel = fuel _object;
	};
	
	/* Get the Inventory of the Vehicle */
	_isNormal = true;
	if (typeOf (_object) == "Plastic_Pole_EP1_DZ") then{
		_isNormal = false;
		_inventory = _object getVariable ["plotfriends", []]; //We're replacing the inventory with UIDs for this item
	}; 
	if (typeOf (_object)in DZE_DoorsLocked) then{
		_isNormal = false;
		_inventory = _object getVariable ["doorfriends", []]; //We're replacing the inventory with UIDs for this item
	};

	if(_isNormal)then {
		_inventory = [
		getWeaponCargo _object,
		getMagazineCargo _object,
		getBackpackCargo _object
		];
	};
	
	/* Get the position of the Vehicle */
	_position 	= getPosASL _object;
	if !(surfaceIsWater _position) then {
		_position =  ASLToATL _position;
	};
	_dir 		= getDir _object;
	_worldspace = [_dir,_position];

	/* Delete the current Database entry */
	[_oldVehicleID,_oldVehicleUID,_player] call server_deleteObj;
	sleep 1;
	
	/* Generate a new UID */
	_vehicleUID = _worldspace call dayz_objectUID3;

	/* Write the new Database entry and LOG the action*/
	_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, _damage , _newKey, _worldspace, _inventory, _array, _fuel,_vehicleUID];
	_key call server_hiveWrite;
	diag_log ("HIVE: WRITE: VEHICLE KEY CHANGER: "+ str(_key)); 
	diag_log format["HIVE: WRITE: VEHICLE KEY CHANGER: Vehicle:%1 NewKey:%2 BY %3(%4)", _object, _newKeyName, (name _player), (getPlayerUID _player)];

	/* Get the ObjectID of the entry in the Database */
	_retry = 0;
	_gotcha = false;
	while {!_gotcha && _retry < 10} do {
		sleep 1;
		
		/* Send the request */
		_key = format["CHILD:388:%1:",_vehicleUID];
		diag_log ("HIVE: READ: VEHICLE KEY CHANGER: "+ str(_key));
		_result = _key call server_hiveReadWrite;
		_outcome = _result select 0;
		
		/* We got a answer */
		if (_outcome == "PASS") then {
			_vehicleID = _result select 1;
			
			/* Compare with old ObjectID to check if it not was deleted yet */
			if (_oldVehicleID == _vehicleID) then {
				/* Not good lets give it another try */
				_gotcha = false;
				_retry = _retry + 1;
			} else {
				/* GOTCHA! */
				diag_log("CUSTOM: VEHICLE KEY CHANGER: Selected " + str(_vehicleID));
				_gotcha = true;
				_retry = 11;

				_object setVariable ["VKC_disabled", 1,true];
				_object setVariable ["VKC_claiming_disabled", 1,true];

				[_object] spawn {
					private ["_veh"];
					_veh = _this select 0;

					sleep 30;
					_veh setVariable ["VKC_disabled", 0,true];
					_veh setVariable ["VKC_claiming_disabled", 0,true];
				};

				PVDZE_vkc_Success = true;
				(owner _player) publicVariableClient "PVDZE_vkc_Success";

				/* Lock the Vehicle */
				_object setVehicleLock "locked";
	
				/* Save the ObjectID and ObjectUID to the vehicles variable and make it public */
				_object setVariable ["ObjectID", _vehicleID, true];
				_object setVariable ["ObjectUID", _vehicleUID, true];
	
				/* Set the lastUpdate time to current */
				_object setVariable ["lastUpdate",time,true];
	
				/* Set the CharacterID to the new Key so we can access it! */
				_object setVariable ["CharacterID", _newKey, true];
	
				/* Some other variables you might need for disallow lift/tow/cargo locked Vehicles and such */
				/* Uncomment if you use this */
	
				/* R3F Arty and LOG block lift/tow/cargo locked vehicles*/
				_object setVariable ["R3F_LOG_disabled",true,true];

				/* =BTC= Logistic block lift locked vehicles*/
				_object setVariable ["BTC_Cannot_Lift",true,true];
			};
		} else {
			/* Something went wrong on the request give it another try */
			diag_log("CUSTOM: VEHICLE KEY CHANGER: trying again to get id for: " + str(_vehicleUID));
			_gotcha = false;
			_retry = _retry + 1;
		};
	};
};
// TODO ----------------------

_object setVariable ["lastUpdate",time,true];
switch (_type) do {
	case "all": {
		call _object_position;
		call _object_inventory;
		call _object_damage;
		};
	case "position": {
		if (!(_object in needUpdate_objects)) then {
			//diag_log format["DEBUG Position: Added to NeedUpdate=%1",_object];
			needUpdate_objects set [count needUpdate_objects, _object];
		};
	};
	case "gear": {
		call _object_inventory;
			};
	case "damage": {
		if ( (time - _lastUpdate) > 5) then {
			call _object_damage;
		} else {
			if (!(_object in needUpdate_objects)) then {
				//diag_log format["DEBUG Damage: Added to NeedUpdate=%1",_object];
				needUpdate_objects set [count needUpdate_objects, _object];
			};
		};
	};
	case "killed": {
		call _object_killed;
	};
	case "repair": {
		call _object_damage;
	};
	case "vehiclekey": {
		_activatingPlayer = _this select 2;
		_vehicleClassname = _this select 3;
		_toKey = _this select 4;
		_toKeyName = _this select 5;
		_vehicle_ID = _this select 6;
		_vehicle_UID = _this select 7;
		[_activatingPlayer, _vehicleClassname, _toKey, _toKeyName, _vehicle_ID, _vehicle_UID] call _object_vehicleKey;
	};
};
