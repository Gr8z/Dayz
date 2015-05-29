removeVehicleAmmo = {
    private ['_getTurretPaths','_removalPath'];

    _getTurretPaths = { // Find every turret path on the vehicle with exception of [-1], driver.
        private ['_return','_tracker'];
        _return = [];

        _tracker = {
            private ['_config','_path','_path2','_class'];
            _config = (_this select 0);
            _path = +(_this select 1);
            for '_i' from 0 to ((count _config) - 1) do {
                _class = (_config select _i);
                if (isClass _class) then {
                    _path2 = (_path + [_i]);
                    _return set [(count _return),_path2];
                    _class = (_class >> 'turrets');
                    if (isClass _class) then {
                        [_class,_path2] call _tracker;
                    };
                };
            };
        };
        [(configFile >> 'cfgVehicles' >> (typeOf _this) >> 'turrets'),[]] call _tracker;
        _return
    };

    { // Remove turret magazines. (All but pilot)
        _removalPath = _x;
        {
            if (!(['flare',_x] call fnc_inString) && !(['horn',_x] call fnc_inString) ) then {
                _this removeMagazinesTurret [_x,_removalPath];
            };
            true
        } count (_this magazinesTurret _removalPath);
        true
    } count (_this call _getTurretPaths);

    { // Remove pilot magazines.
        {
            if (!(['flare',_x] call fnc_inString) && !(['horn',_x] call fnc_inString) ) then {
                _this removeMagazinesTurret [_x,[-1]];
            };
            true
        } count (getArray (configFile >> 'cfgWeapons' >> _x >> 'magazines'));
        true
    } count getArray(configFile >> 'cfgVehicles' >> (typeOf _this) >> 'weapons');
};


waitUntil {!isNil 'fnc_veh_ResetEH'};
new_fnc_veh_ResetEH = fnc_veh_ResetEH;
fnc_veh_ResetEH = {
    _this call new_fnc_veh_ResetEH;
    if (isServer) then {
        _this call removeVehicleAmmo;
    };
};