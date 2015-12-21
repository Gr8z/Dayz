dami_indestructables = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","BagFenceRound_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Land_HBarrier5_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodStairsRails_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","CinderWallHalf_DZ","CinderWall_DZ","MetalFloor_DZ","WoodRamp_DZ","GunRack_DZ","FireBarrel_DZ","WoodCrate_DZ","Scaffolding_DZ"];
dami_indarra = [];
private ["_nul","_result","_pos","_wsDone","_dir","_block","_isOK","_countr","_objWpnTypes","_objWpnQty","_dam","_selection","_totalvehicles","_object","_idKey","_type","_ownerID","_worldspace","_intentory","_hitPoints","_fuel","_damage","_key","_vehLimit","_hiveResponse","_objectCount","_codeCount","_data","_status","_val","_traderid","_retrader","_traderData","_id","_lockable","_debugMarkerPosition","_vehicle_0","_bQty","_vQty","_BuildingQueue","_objectQueue"];
dayz_versionNo 		= getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo 	= getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");

_hiveLoaded = false;

diag_log "HIVE: Starting...";
waituntil{!(isNil "PVOZ_serverreadyforhc")};
diag_log "HIVE: Started!";

serverVehicleCounter = [];
PVOZ_HChiveRES = nil;
PVOZ_HChiveQueue = nil;
PVOZ_objectMonitor = [];
_hiveResponse = [];
_BuildingQueue = [];
_objectQueue = [];
PVOZ_HCreqHiveRes = [player];


publicVariableServer "PVOZ_HCreqHiveRes";
waitUntil {!isNil "PVOZ_HChiveQueue"};
diag_log ("PVOZ_HChiveQueue contents: "+str PVOZ_HChiveQueue);
_BuildingQueue = PVOZ_HChiveQueue select 0;
_objectQueue = PVOZ_HChiveQueue select 1;

_totalvehicles = 0;
_unlockedvehiclesm8 = 0;
{
	_idKey 		= _x select 1;
	_type 		= _x select 2;
	_ownerID 	= _x select 3;
	_worldspace = _x select 4;
	_intentory 	= _x select 5;
	_hitPoints 	= _x select 6;
	_fuel 		= _x select 7;
	_damage 	= _x select 8;
	_dir 		= 0;
	
	_pos = [0,0,0];
	_wsDone = false;
	if (count _worldspace >= 2) then {
		if ((typeName (_worldspace select 0)) == "STRING") then {
			_worldspace set [0, call compile (_worldspace select 0)];
			_worldspace set [1, call compile (_worldspace select 1)];
		};
		_dir = _worldspace select 0;
		if (count (_worldspace select 1) == 3) then {
			_pos = _worldspace select 1;
			_wsDone = true;
		}
	};
	
	if (!_wsDone) then {
		if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
		_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
		if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
		diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
	};
	
	_vector = [[0,0,0],[0,0,0]];
	_vecExists = false;
	_ownerPUID = "0";
	if (count _worldspace >= 3) then {
		if (count _worldspace == 3) then {
			if (typename (_worldspace select 2) == "STRING") then {
				_ownerPUID = _worldspace select 2;
			} else {
				 if (typename (_worldspace select 2) == "ARRAY") then {
					_vector = _worldspace select 2;
					if (count _vector == 2) then {
						if (((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3)) then {
							_vecExists = true;
						};
					};
				};					
			};
		} else {
			if (count _worldspace == 4) then {
				if (typename (_worldspace select 3) == "STRING") then {
					_ownerPUID = _worldspace select 3;
				} else {
					if (typename (_worldspace select 2) == "STRING") then {
						_ownerPUID = _worldspace select 2;
					};
				};
				if (typename (_worldspace select 2) == "ARRAY") then {
					_vector = _worldspace select 2;
					if (count _vector == 2) then {
						if (((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3)) then {
							_vecExists = true;
						};
					};
				} else {
					if (typename (_worldspace select 3) == "ARRAY") then {
						_vector = _worldspace select 3;
						if (count _vector == 2) then {
							if (((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3)) then {
								_vecExists = true;
							};
						};
					};
				};
			} else {};
		};
	};
	
	if (_damage < 1) then {
		_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
		_object setVariable ["lastUpdate",time];
		_object setVariable ["ObjectID", _idKey, true];
		_object setVariable ["OwnerPUID", _ownerPUID, true];
		
		_lockable = 0;
		if (isNumber (configFile >> "CfgVehicles" >> _type >> "lockable")) then {
			_lockable = getNumber(configFile >> "CfgVehicles" >> _type >> "lockable");
		};
		
		if (_lockable == 4) then {
			_codeCount = (count (toArray _ownerID));
			if (_codeCount == 3) then {
				_ownerID = format["0%1", _ownerID];
			};
			if (_codeCount == 2) then {
				_ownerID = format["00%1", _ownerID];
			};
			if (_codeCount == 1) then {
				_ownerID = format["000%1", _ownerID];
			};
		};

		if (_lockable == 3) then {
			_codeCount = (count (toArray _ownerID));
			if (_codeCount == 2) then {
				_ownerID = format["0%1", _ownerID];
			};
			if (_codeCount == 1) then {
				_ownerID = format["00%1", _ownerID];
			};
		};
		
		_object setVariable ["CharacterID", _ownerID, true];
		
		clearWeaponCargoGlobal  _object;
		clearMagazineCargoGlobal  _object;
		_object call dami_ammovehicle;
		
		_object setdir _dir;
		
		if (_vecExists) then {_object setVectorDirAndUp _vector};
		
		_object setposATL _pos;
		_object setDamage _damage;
		
		if ((typeOf _object) in dayz_allowedObjects) then {
			if (typeOf _object in dami_indestructables) then {
				_object addEventHandler ["HandleDamage", {false}];
				_object allowDamage false;
			} else {
				_object addEventHandler ["HandleDamage", {_this call dami_bohandleDamage}];
				_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled}];
			};
			_object enableSimulation false;
			_object setVariable ["OEMPos", _pos, true];
		};

		if (count _intentory > 0) then {
			if (_type in DZE_LockedStorage) then {
				_object setVariable ["WeaponCargo", (_intentory select 0),true];
				_object setVariable ["MagazineCargo", (_intentory select 1),true];
				_object setVariable ["BackpackCargo", (_intentory select 2),true];
			} else {
				_objWpnTypes = (_intentory select 0) select 0;
				_objWpnQty = (_intentory select 0) select 1;
				_countr = 0;					
				{
					if (_x in (DZE_REPLACE_WEAPONS select 0)) then {
						_x = (DZE_REPLACE_WEAPONS select 1) select ((DZE_REPLACE_WEAPONS select 0) find _x);
					};
					_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
					if (_isOK) then {
						_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
					};
					_countr = _countr + 1;
				} count _objWpnTypes;
				
				_objWpnTypes = (_intentory select 1) select 0;
				_objWpnQty = (_intentory select 1) select 1;
				_countr = 0;
				{
					if (_x == "BoltSteel") then { _x = "WoodenArrow" };
					if (_x == "ItemTent") then { _x = "ItemTentOld" };
					_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
					if (_isOK) then {
						_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
					};
					_countr = _countr + 1;
				} count _objWpnTypes;
				
				_objWpnTypes = (_intentory select 2) select 0;
				_objWpnQty = (_intentory select 2) select 1;
				_countr = 0;
				{
					_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
					if (_isOK) then {
						_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
					};
					_countr = _countr + 1;
				} count _objWpnTypes;
			};
		};	
		
		if (_object isKindOf "AllVehicles") then {
			{
				_selection = _x select 0;
				_dam = _x select 1;
				if (_selection in dayZ_explosiveParts && _dam > 0.8) then {_dam = 0.8};
				[_object,_selection,_dam] call object_setFixServer;
			} forEach _hitpoints;

			_object setFuel _fuel;

			if (!((typeOf _object) in dayz_allowedObjects)) then {
				_object call fnc_veh_ResetEH;
				if ((_ownerID != "0") && !(_object isKindOf "Bicycle")) then {
					_object setvehiclelock "locked";
					_object setVariable ["Tow_settings_disabled",true,true];
				} else {_unlockedvehiclesm8 = _unlockedvehiclesm8 + 1};
				
				_szobjarr = [];
				{if (_object distance _x < 90) then {_szobjarr set [count _szobjarr, _object]}} forEach [zonestary,zonebash,zoneklen,zonebank];
				PVOZ_deleteSZvehicles = [_szobjarr];publicVariableServer "PVOZ_deleteSZvehicles";
				
				_totalvehicles = _totalvehicles + 1;
				serverVehicleCounter set [count serverVehicleCounter,_type];
			};
		};
		PVOZ_objectMonitor set [count PVOZ_objectMonitor,_object];
	};
} forEach (_BuildingQueue + _objectQueue);
diag_log ("HIVE: Done spawning objects and vehicles! Total: "+str (count PVOZ_objectMonitor));
publicVariableServer "PVOZ_objectMonitor";

_vehLimit = MaxVehicleLimit - _unlockedvehiclesm8;
if (_vehLimit > 0) then {
	PVOZ_spawnvehiclessrvr = [_vehLimit,serverVehicleCounter];publicVariableServer "PVOZ_spawnvehiclessrvr";
} else {
	diag_log "HIVE: Vehicle Spawn limit reached!";
};

allowConnection = true;
PVOZ_serverSMDONE = true;publicVariableServer "PVOZ_serverSMDONE";