private ["_activatingPlayer","_isOK","_object","_worldspace","_location","_dir","_class","_uid","_key","_keySelected","_characterID","_donotusekey"];
//PVDZE_veh_Publish2 = [_veh,[_dir,_location],_part_out,false,_keySelected,_activatingPlayer];
_object 			= _this select 0;
_worldspace 		= _this select 1;
_class 				= _this select 2;
_donotusekey 		= _this select 3;
_keySelected 		= _this select 4;
_activatingPlayer 	= _this select 5;
_isOK = (if (_donotusekey) then {true} else {isClass(configFile >> "CfgWeapons" >> _keySelected)});
_characterID = (if (_donotusekey) then {_keySelected} else {str(getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid"))});
if (!_isOK) exitWith {diag_log ("HIVE: CARKEY DOES NOT EXIST: "+ str(_keySelected))};

diag_log ("PUBLISH: Attempt " + str(_object));
_dir 		= _worldspace select 0;
_location 	= _worldspace select 1;
_uid 		= _worldspace call dayz_objectUID3;
_key 		= format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
_key call server_hiveWrite;

[_object,_uid,_characterID,_class,_dir,_location,_donotusekey,_activatingPlayer] spawn {
	private ["_object","_uid","_characterID","_done","_retry","_key","_result","_outcome","_oid","_class","_location","_object_para","_donotusekey","_activatingPlayer"];
	_object 		= _this select 0;
	_uid 			= _this select 1;
	_characterID 	= _this select 2;
	_class 			= _this select 3;
	_location 		= _this select 5;
	_donotusekey 	= _this select 6;
	_activatingPlayer = _this select 7;
	
	_done = false;
	_retry = 0;
	while {_retry < 10} do {
		uiSleep 1;
		_key = format["CHILD:388:%1:",_uid];
		diag_log ("HIVE: WRITE: "+ str(_key));
		_result = _key call server_hiveReadWrite;
		_outcome = _result select 0;
		if (_outcome == "PASS") then {
			_oid = _result select 1;
			diag_log("CUSTOM: Selected " + str(_oid));
			_done = true;
			_retry = 100;
		} else {
			diag_log("CUSTOM: trying again to get id for: " + str(_uid));
			_done = false;
			_retry = _retry + 1;
		};
	};
	deleteVehicle _object;
	
	if (!_done) exitWith {diag_log("CUSTOM: failed to get id for : " + str(_uid))};
	_object = createVehicle [_class, _location, [], 0, "CAN_COLLIDE"];
	_object setVariable ["ObjectID", _oid, true];
	_object setVariable ["lastUpdate",time + 10];
	_object setVariable ["CharacterID", _characterID, true];
	_object call fnc_veh_ResetEH;
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	if (!_donotusekey) then {_object setvehiclelock "locked"};
	_object call dami_ammovehicle;
	PVDZE_veh_Init = _object;
	publicVariable "PVDZE_veh_Init";
	diag_log format ["PUBLISH: %1 bought %2 with ID: %3 CHARID: %4 OBJID: %5",_activatingPlayer,_class,_uid,_characterID,_oid];
};