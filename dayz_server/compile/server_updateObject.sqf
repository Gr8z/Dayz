private ["_object","_type","_objectID","_uid","_lastUpdate","_needUpdate","_object_position","_object_inventory","_object_damage","_isNotOk","_parachuteWest","_firstTime","_object_killed","_object_repair","_isbuildable","_garagelist"];
_object = _this select 0;
if (isNull(_object)) exitWith {diag_log format["Skipping Null Object: %1", _object]};
if ((typeOf _object) == "Land_MBG_Garage_Single_C") then {_garagelist = _this select 2;};

_type 			= _this select 1;
_parachuteWest 	= ((typeOf _object == "ParachuteWest")||(typeOf _object == "ParachuteC"));
_isbuildable 	= (typeOf _object) in dayz_allowedObjects;
_isNotOk 		= false;
_firstTime 		= false;
_objectID 		= _object getVariable ["ObjectID","0"];
_uid 			= _object getVariable ["ObjectUID","0"];

if ((typeName _objectID != "string")||(typeName _uid != "string")) then {
    diag_log(format["Non-string Object: ID %1 UID %2", _objectID, _uid]);
    _objectID = "0";
    _uid = "0";
};

if (!_parachuteWest and !(locked _object)) then {
	if ((_objectID == "0")&&(_uid == "0")) then {
		_object_position = getPosATL _object;
    	_isNotOk = true;
	};
};

if ((_isNotOk and _isbuildable)&&!((typeOf _object) in ["Land_MBG_Garage_Single_C","HeliH"])) exitWith {};

_lastUpdate = _object getVariable ["lastUpdate",time];
_needUpdate = (if (_object in update_whitelist) then [{false},{_object in needUpdate_objects}]);

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
	_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
	_key call server_hiveWrite;
};
_object_inventory = {
	private["_inventory","_previous","_key"];
		if ((typeOf _object) == "Land_MBG_Garage_Single_C") then {
			if (isNil "_garagelist") then {
				_garagelist = _object getVariable ["StoredVehicles",[]];
			};
			if (_objectID == "0") then {
				_key = format["CHILD:309:%1:%2:",_uid,_garagelist];
			} else {
				_key = format["CHILD:303:%1:%2:",_objectID,_garagelist];
			};
			_key call server_hiveWrite;
		} else {
			_isNormal = true;
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
				_object setVariable["lastInventory",_inventory];
				if (_objectID == "0") then {
					_key = format["CHILD:309:%1:%2:",_uid,_inventory];
				} else {
					_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
				};
				_key call server_hiveWrite;
			};
		};
};
_object_hitpoints = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage","_updateType"];
	
	_updateType = _this select 0;
	_hitpoints = _object call vehicle_getHitpoints;
	if (_updateType != "killed") then {_damage = damage _object;} else {_damage = 1;};
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		if (_updateType == "killed") then {_hit = 1;};
		_object setHit ["_selection", _hit]
	} forEach _hitpoints;
	if (_objectID == "0") then {
		_key = format["CHILD:306:%1:%2:%3:",_uid,_array,_damage];
	} else {
		_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
	};
	_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
};
_object setVariable ["lastUpdate",time,true];
_object setVariable ["lastPosition",(getPosATL _object),true];
_object setVariable ["lastHitpoints",(_object call vehicle_getHitpoints),true];
if (_type == "all") then {
	call _object_position;
	call _object_inventory;
	[_type] call _object_hitpoints;
};
if (_type == "position") then {
	if (!(_object in needUpdate_objects)) then {
		needUpdate_objects set [count needUpdate_objects, _object];
	};
};
if (_type == "gear") then _object_inventory;
if (_type == "damage") then {
	if ( (time - _lastUpdate) > 5) then {
		[_type] call _object_hitpoints;
	} else {
		if (!(_object in needUpdate_objects)) then {
			needUpdate_objects set [count needUpdate_objects, _object];
		};
	};
};
if (_type == "killed" || _type == "repair") then {
	[_type] call _object_hitpoints;
};