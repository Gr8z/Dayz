getDeployableKitClass = {
    (DZE_DEPLOYABLES select _this) select 0
};
getDeployableDistanceOffset = {
    (DZE_DEPLOYABLES select _this) select 1
};
getDeployablePackDistance = {
    (DZE_DEPLOYABLES select _this) select 2
};
getDamageLimit = {
    (DZE_DEPLOYABLES select _this) select 3
};
getDeployablePackOthers = {
    (DZE_DEPLOYABLES select _this) select 4
};
getClearCargo = {
    (DZE_DEPLOYABLES select _this) select 5
};
getPermanent = {
    (DZE_DEPLOYABLES select _this) select 6
};
getDeployableClass = {
    (DZE_DEPLOYABLES select _this) select 7
};

getDeployableNeedNearBy = {
    (DZE_DEPLOYABLES select _this) select 8
};
getDeployableParts = {
    (DZE_DEPLOYABLES select _this) select 9
};
getDeployableRequirePlot = {
    (DZE_DEPLOYABLES select _this) select 10
};
getDeployableSimulation = {
    (DZE_DEPLOYABLES select _this) select 11
};
getDeployableBuildOnRoad = {
    (DZE_DEPLOYABLES select _this) select 12
};
getDeployableCondition = {
    (DZE_DEPLOYABLES select _this) select 13
};
getDeployableClearAmmo = {
    (DZE_DEPLOYABLES select _this) select 14
};
getDeployablePackAny = {
    ((_this call getDamageLimit) >= 0) || (!(isNull player) && {(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS});   
};
getDeployableKitType = {
    private["_return"];
    if(isClass(configFile >> "CfgWeapons" >> (_this call getDeployableKitClass))) then {
        _return = "CfgWeapons";
    } else {
        _return = "CfgMagazines";
    };
    _return
};
getActionId = {
  call compile format["
    if (isNil 'DZE_ACTION_DEPLOYABLE_PACK_%1') then {
        DZE_ACTION_DEPLOYABLE_PACK_%1 = -1;
    };
    DZE_ACTION_DEPLOYABLE_PACK_%1
  ",_this];  
};
setActionId = {
  call compile format["DZE_ACTION_DEPLOYABLE_PACK_%1 = %2;",_this select 0,_this select 1];  
};
getDeployableKitDisplay = {
    private["_display"];
    _display = getText (configFile >> (_this call getDeployableKitType) >> (_this call getDeployableKitClass) >> "displayName");
    if((isNil "_display")||_display == "") then {
        _display = (_this call getDeployableKitClass);
    };
    _display
};
getDeployableDisplay = {
    private["_display","_class"];
    _class = (_this call getDeployableClass);
    _display = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
    if((isNil "_display")||_display == "") then {
        _display = _class;
    };
    {
        if(_class == (_x select 0)) then {
            _display = (_x select 1);
        };
    } forEach DZE_DEPLOYABLE_NAME_MAP;
    _display
};
getDeployableIndex = {
    private["_return"];
    _return = -1;
    {
        if(_this == (_forEachIndex call getDeployableClass)) then {
            _return = _forEachIndex;
        }
    } forEach DZE_DEPLOYABLES;
    _return
};
getHasDeployableParts = {
    private["_player","_weapons","_parts","_item","_params","_index","_part","_return","_inventory"];
    _params    = _this;
    _player    = _params select 0;
    _index     = _params select 1;
    _parts     = _index call getDeployableParts;
    _inventory = (weapons _player) + (magazines _player) + [(typeOf (unitBackpack _player))];
    _return    = true;
    {
        _part = _x;
        if(!(_part in _inventory)) exitWith {_return = false;};
        {
            _item = _x;
            if(_item == _part) exitWith {_inventory set [_forEachIndex,"nil"];};
        } forEach _inventory;
    } forEach _parts;
    _return
};
removeDeployableParts = {
    private["_player","_params","_index","_parts","_part"];
    _params = _this;
    _player = _params select 0;
    _index  = _params select 1;
    _parts  = _index call getDeployableParts;
    {
        _part = _x;
        _player removeWeapon _part;
        _player removeMagazine _part;
        if (isClass(configFile >> "CfgVehicles" >> _part)) then {
			removeBackpack _player;
		};
    } forEach _parts;
};