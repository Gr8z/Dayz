if (LOG_INPROGRESS) then{
	_msg = "Failed, the current operation is not finished yet";
	systemChat ("(GG-AH): "+str _msg);
	_msg call AH_fnc_dynTextMsg;
} else {
	LOG_INPROGRESS = true;
	private ["_heliporteur", "_object"];
	_heliporteur = _this select 0;
	_object = nearestObjects [_heliporteur, LOG_CFG_ISLIFTABLE, 20];
	_object = _object - [_heliporteur];	
	if (count _object > 0) then{
		_object = _object select 0;	
		if !(_object getVariable "LOG_disabled") then {
			if (isNull (_object getVariable "LOG_moves_by")) then {
				if (count crew _object == 0) then{	
					if (isNull (_object getVariable "LOG_moves_by") || (!alive (_object getVariable "LOG_moves_by"))) then{
						private ["_no_trailer", "_trailer"];
						_no_trailer = true;
						_trailer = _object getVariable "LOG_trailer";
						if !(isNil "_trailer") then{if !(isNull _trailer) then{ _no_trailer = false}};
						if (_no_trailer) then{
							_heliporteur setVariable ["LOG_heliporte", _object, true];
							_object setVariable ["LOG_moves_by", _heliporteur, true];
							_object attachTo [_heliporteur, [0,0,(boundingBox _heliporteur select 0 select 2) - (boundingBox _object select 0 select 2) - (getPos _heliporteur select 2) + 0.5]];
							_msg = format["Vehicle %1 lifted", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
							systemChat ("(GG-AH): "+str _msg);
							_msg call AH_fnc_dynTextMsg
						} else {
							_msg = format["Cannot lift %1, it is towing another vehicle", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
							systemChat ("(GG-AH): "+str _msg);
							_msg call AH_fnc_dynTextMsg
						};
					} else {
						_msg = format["Cannot lift %1, it is being moved", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
						systemChat ("(GG-AH): "+str _msg);
						_msg call AH_fnc_dynTextMsg
					};
				} else {
					_msg = format["Cannot lift %1, there is a player inside", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
					systemChat ("(GG-AH): "+str _msg);
					_msg call AH_fnc_dynTextMsg
				};
			} else {
				_msg = format["Cannot lift %1, it is already being transported", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
				systemChat ("(GG-AH): "+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
		};
	};
	LOG_INPROGRESS = false;
};