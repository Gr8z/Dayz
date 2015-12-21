if (LOG_INPROGRESS) then{
	_msg = "Failed, the current operation is not finished yet";
	systemChat ("(ArmA-AH): "+str _msg);
	_msg call AH_fnc_dynTextMsg;
} else {
	LOG_INPROGRESS = true;
	private ["_carrier","_object"];
	_carrier = _this select 0;
	_object = _carrier getVariable "LOG_heliporte";
	_carrier setVariable ["LOG_heliporte", objNull, true];
	_object setVariable ["LOG_moves_by", objNull, true];
	[_object] call LOG_FNCT_DETACH_AND_SAVE;
	
	_msg = format["Vehicle %1 dropped", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
	systemChat ("(ArmA-AH): "+str _msg);
	_msg call AH_fnc_dynTextMsg;
	LOG_INPROGRESS = false;
};
