if (LOG_INPROGRESS) then{
	_msg = "Failed, the current operation is not finished yet";
	systemChat ("(GG-AH): "+str _msg);
	_msg call AH_fnc_dynTextMsg;
} else {
	LOG_INPROGRESS = true;
	private ["_object","_tug"];
	_object = LOG_OBJECT_SELECTION;
	_tug = _this select 0;
	
	if (!(isNull _object) && (alive _object) && !(_object getVariable "LOG_disabled")) then{	
		if (isNull (_object getVariable "LOG_moves_by") && (isNull (_object getVariable "LOG_moves_by") || (!alive (_object getVariable "LOG_moves_by")))) then{
			if ( _object distance _tug <= 20 ) then{
				
				_tug setVariable ["LOG_trailer", _object, true];
				
				_object setVariable ["LOG_moves_by", _tug, true];
				
				player attachTo [_tug, [(boundingBox _tug select 1 select 0),(boundingBox _tug select 0 select 1) + 1,(boundingBox _tug select 0 select 2) - (boundingBox player select 0 select 2)]];
				
				player setDir 270;
				player setPos (getPos player);
				
				player playActionNow "Medic";
				sleep 2;
				
				_object setVelocity [0,0,0];
				_object attachTo [ _tug, [0,(boundingBox _tug select 0 select 1) + (boundingBox _object select 0 select 1) + 2,(boundingBox _tug select 0 select 2) - (boundingBox _object select 0 select 2)]];
			
				LOG_OBJECT_SELECTION = objNull;
				detach player;
					
				sleep 3;
				_msg = format["Vehicle %1 towed", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
				systemChat ("(GG-AH): "+str _msg);
				_msg call AH_fnc_dynTextMsg;	
			} else {
				_msg = format["Vehicle %1 is too far away to be towed", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
				systemChat ("(GG-AH): "+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
		} else {
			_msg = format["Vehicle %1 is in transit", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
			systemChat ("(GG-AH): "+str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
	};
	LOG_INPROGRESS = false;
};
