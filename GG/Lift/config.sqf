LOG_CFG_ALLOW_LOCKED = false;	 	/* allow to transport locked vehicles */
LOG_CFG_ALLOW_CHAINING = false; 	/* allow chain towing  */
LOG_CFG_ALLOW_GETIN = false; 		/* allow player to get into a towed / lifted object  */

/*--------------------------------------------------------------------------------------------------------------
	LIST OF VEHICLES THAT CAN TOW
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_CANTOW = ["ExampleVehicle_ep1"];
//Adds all Land vehicles.
_cfgvehicles = configFile >> 'cfgVehicles';
for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if !(_veh_type isKindOf "StaticWeapon") then {
			if !(_veh_type isKindOf "TT650_Base") then {
				if !(_veh_type isKindOf "Old_moto_base") then {
					if !(_veh_type isKindOf "Old_bike_base_EP1") then {
						if !(_veh_type isKindOf "ATV_Base_EP1") then {
							if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") || (_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
								LOG_CFG_CANTOW = LOG_CFG_CANTOW + [_veh_type];
							};
						};
					};
				};
			};
		};
	};
};
//List of vehicles you don't want to give the towing ability to.
LOG_CFG_CANTOW = LOG_CFG_CANTOW - ["MMT_Civ","Old_bike_TK_INS_EP1","TT650_Civ","TT650_Ins","TT650_TK_CIV_EP1","ATV_US_EP1","ATV_CZ_EP1","M1030_US_DES_EP1","Old_moto_TK_Civ_EP1","tractor","tractorOld"];


/*--------------------------------------------------------------------------------------------------------------
	LIST OF VEHICLES THAT ARE TOWABLE
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_ISTOWABLE = ["ExampleVehicle_ep1"];
//Adds all Air/Sea/Land vehicles.
for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if ((_veh_type isKindOf "Air")||(_veh_type isKindOf "Ship")||(_veh_type isKindOf "LandVehicle")) then {
			if !(_veh_type isKindOf "StaticWeapon") then {
				if ((getNumber (_vehicle >> "scope") == 2) && !((_veh_type isKindOf "ParachuteBase")||(_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
					LOG_CFG_ISTOWABLE = LOG_CFG_ISTOWABLE + [_veh_type];
				};
			};
		};
	};
};
//List of vehicles you don't want to be towable by towing capable objects.
LOG_CFG_ISTOWABLE = LOG_CFG_ISTOWABLE - ["ExampleVehicle_ep1","CH_47F_EP1_DZE","MV22_DZ"];

/*--------------------------------------------------------------------------------------------------------------
	LIST OF HELIS THAT CAN LIFT
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_CANLIFT = ["ExampleVehicle_ep1"];
//Adds all helicopters.
for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if (_veh_type isKindOf "Helicopter") then {
			if !(_veh_type isKindOf "StaticWeapon") then {
				if ((getNumber (_vehicle >> "scope") == 2) && !((_veh_type isKindOf "ParachuteBase")||(_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
					LOG_CFG_CANLIFT = LOG_CFG_CANLIFT + [_veh_type];
				};
			};
		};
	};
};
//List of helis you don't want to give the lifting ability to.
LOG_CFG_CANLIFT = LOG_CFG_CANLIFT - ["ExampleVehicle_ep1","CSJ_GyroP","CSJ_GyroCover","CSJ_GyroC"];

/*--------------------------------------------------------------------------------------------------------------
		LIST OF VEHICLES THAT ARE LIFTABLE
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_ISLIFTABLE = ["ExampleVehicle_ep1"];
//Adds all Sea/Land vehicles.
for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if ((_veh_type isKindOf "LandVehicle")||(_veh_type isKindOf "Ship")) then {
			if !(_veh_type isKindOf "StaticWeapon") then {
				if ((getNumber (_vehicle >> "scope") == 2) && !((_veh_type isKindOf "ParachuteBase")||(_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
					LOG_CFG_ISLIFTABLE = LOG_CFG_ISLIFTABLE + [_veh_type];
				};
			};
		};
	};
};
//List of vehicles you don't want to be liftable.
LOG_CFG_ISLIFTABLE = LOG_CFG_ISLIFTABLE - ["ExampleVehicle_ep1"];