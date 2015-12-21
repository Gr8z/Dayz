if (LOG_INPROGRESS) then {
	_msg = "Failed, the current operation is not finished yet";
	systemChat ("(ArmA-AH): "+str _msg);
	_msg call AH_fnc_dynTextMsg;
} else{
	LOG_OBJECT_SELECTION = _this select 0;
	_msg = format["Select the vehicle which will tow %1", getText (configFile >> "CfgVehicles" >> (typeOf LOG_OBJECT_SELECTION) >> "displayName")];
	systemChat ("(ArmA-AH): "+str _msg);
	_msg call AH_fnc_dynTextMsg;
};
