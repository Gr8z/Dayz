if (LOG_INPROGRESS) then {
	_msg = "Failed, the current operation is not finished yet";
	systemChat ("Server: "+str _msg);
	_msg call AH_fnc_dynTextMsg;
} else{
	LOG_INPROGRESS = true;
	private ["_tug","_object"];
	_object = _this select 0;
	_tug = _object getVariable "LOG_moves_by";
	if ({_tug isKindOf _x} count LOG_CFG_CANTOW > 0) then{
		_tug setVariable ["LOG_trailer", objNull, true];
		_object setVariable ["LOG_moves_by", objNull, true];			
		[_object] call LOG_FNCT_DETACH_AND_SAVE;
		sleep 3;
		_msg = format["Vehicle %1 untowed", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
		systemChat ("Server: "+str _msg);
		_msg call AH_fnc_dynTextMsg;
	} else {
		_msg = "Failed, only the pilot can detach this vehicle";
		systemChat ("Server: "+str _msg);
		_msg call AH_fnc_dynTextMsg;
	};
	LOG_INPROGRESS = false;
};
