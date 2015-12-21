AH_cleanUnit = {
	if !(isNull _this) then {
		_group = group _this;
		_this removeAllMPEventHandlers "mpkilled";
		_this removeAllMPEventHandlers "mphit";
		_this removeAllMPEventHandlers "mprespawn";
		_this removeAllEventHandlers "FiredNear";
		_this removeAllEventHandlers "HandleDamage";
		_this removeAllEventHandlers "Killed";
		_this removeAllEventHandlers "Fired";
		_this removeAllEventHandlers "GetOut";
		_this removeAllEventHandlers "GetIn";
		_this removeAllEventHandlers "Local";
		clearVehicleInit _this;
		_objectID 	= _this getVariable ['ObjectID','0'];
		_objectUID 	= _this getVariable ['ObjectUID','0'];
		deleteVehicle _this;
		if ((count (units _group) == 0)&&(!isNull _group)) then {
			deleteGroup _group;
		};
	};
};
[] spawn {
	while {1 == 1} do {
		uiSleep (60*15);
		_clutter = ["wreck","crater","craterlong","PartWoodPile","Land_Fire"];
		_objectlist = [];
		{_objectlist = _objectlist + allMissionObjects _x} count _clutter;
		_objectsX = _objectlist + alldead;
		_deletedZOM = 0;
		_deletedPLR = 0;
		_deletedCLT = 0;
		_deletedANI = 0;
		_deletedINV = 0;
		_deletedVEH = 0;
		_deletedSEA = 0;
		_deletedFLY = 0;
		_deletedBOX = 0;
		_deletedGRP = 0;
		{
			if !(isNull _x) then {
				_players2 = {isPlayer _x} count (getPos _x nearEntities [["CAManBase"], 200]);
				if (_x in _clutter) then {
					deleteVehicle _x;
					_deletedCLT = _deletedCLT + 1;
				};
				if ((_players2 < 2) && (_x isKindOf "zZombie_Base")) then {
					_x call AH_cleanUnit;
					_deletedZOM = _deletedZOM + 1;
				};
				if ((_players2 == 0) && (_x isKindOf "CAAnimalBase") && (typeOf _x != "DZ_fin") && (typeOf _x != "DZ_pastor")) then {
					_x call AH_cleanUnit;
					_deletedANI = _deletedANI + 1;
				};
			};
		} forEach _objectsX;
		//Not needed if running epoch
		{
			if !(isNull _x) then {
				if ((_x in alldead) && (_x isKindOf "CAManBase")) then {
					_deathTime = _x getVariable ["processedDeath",0];
					if (_deathTime != 0) then {
						if ((diag_tickTime - _deathTime) >= (60*30)) then {
							_x call AH_cleanUnit;
							_deletedPLR = _deletedPLR + 1;
						};
					} else {_x setVariable ["processedDeath",diag_tickTime]};
				};
				_modeldex = typeOf _x;
				if (_modeldex == "Survivor1_DZ") then {
					_x call AH_cleanUnit;
					_deletedINV = _deletedINV + 1;
				};
			};
		} forEach allDead;
		{
			if !(isNull _x) then {
				_x call AH_cleanUnit;
				_deletedSEA = _deletedSEA + 1;
			};
		} forEach allMissionObjects "Seagull";
		{
			if !(isNull _x) then {
				deleteVehicle _x;
				_deletedFLY = _deletedFLY + 1;
			};
		} forEach allMissionObjects "Sound_Flies";
		{
			if !(isNull _x) then {
				if (!(_x isKindOf "AIR")&&!(_x isKindOf "Ship")&&!(_x isKindOf "LandVehicle")) then {
					if (((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 80) then {
						_issf = (typeOf _x) in ["VaultStorage","USBasicAmmunitionBox","StorageShed_DZ"];
						_ismb = _x getVariable ["permaLoot",false];
						if ((!_issf)&&(!_ismb)) then {
							if !(owner _object in [0,1]) then {
								{if (owner _object == owner _x) exitWith {_unit = _x}} forEach playableUnits;
							} else {_unit = 'server'};
							_log = format ["Hackbox (?): %2 deleted @ %1 SPAWNED BY: %3",mapGridPosition (getPos _x),typeOf _x,name _unit];
							"misclog" callExtension (_log);
							diag_log (_log);
							
							_x call AH_cleanUnit;
							_deletedBOX = _deletedBOX + 1;
							_x = nil;
						};
					};
				};
			};
		} forEach allMissionObjects "All";
		//Not needed if running epoch
		_vehicles = [];
		{_vehicles = _vehicles + allMissionObjects _x;} count (['Air','Ship','LandVehicle']);
		{
			if !(isNull _x) then {
				if (((damage _x)>0.9)&&!(_x isKindOf "MAN")) then {
					_x call AH_cleanUnit;
					_deletedVEH = _deletedVEH + 1;
				};
			};
		} forEach _vehicles;
		diag_log format ["(ArmA-AntiHack): Deleted %1 hack box(es).", _deletedBOX];
		diag_log format ["(ArmA-AntiHack): Deleted %1 blown up vehicle(s).", _deletedVEH];
		diag_log format ["(ArmA-AntiHack): Deleted %1 clutter item(s).",_deletedCLT];
		diag_log format ["(ArmA-AntiHack): Deleted %1 dead player(s). (100m radius check)",_deletedPLR];
		diag_log format ["(ArmA-AntiHack): Deleted %1 invisible dead player(s).",_deletedINV];
		diag_log format ["(ArmA-AntiHack): Deleted %1 dead zombie(s). (100m radius check)",_deletedZOM];
		diag_log format ["(ArmA-AntiHack): Deleted %1 dead animal(s). (100m radius check)",_deletedANI];
		diag_log format ["(ArmA-AntiHack): Deleted %1 fly sound(s).", _deletedFLY];
		diag_log format ["(ArmA-AntiHack): Deleted %1 seagull(s).", _deletedSEA];
		uiSleep (60*1.5);
	};
};