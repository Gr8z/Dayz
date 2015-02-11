_key = format["CHILD:104:%1:",dayZ_instance];
_data = "HiveEXT" callExtension _key;
	diag_log format["_data: %1",_data];
_result = call compile format ["%1",_data];
	diag_log format["_result: %1",_result];
diag_log "HIVE: Request sent";
	
//Process result
_status = _result select 0;
	diag_log format["_status: %1",_status];
_myArray = [];
if (_status == "ObjectStreamStart") then {
	_val = _result select 1;
	diag_log format["%1",_val];
	//Stream Objects
	for "_i" from 1 to _val do {
		_data = "HiveEXT" callExtension _key;
		diag_log format["_data: %1",_data];
		_result = call compile format ["%1",_data];
	diag_log format["_result: %1",_result];
		_myArray set [count _myArray,_result];
	diag_log format["_myArray: %1",_myArray];
	};
	
};

{
	_playerId = _x select 0;
	diag_log format["_playerId: %1",_playerId];
	_playerIdType = typeName _playerId;
	diag_log format["TypeName _playerId: %1",_playerIdType];
	_adminLevel = _x select 1;
	diag_log format["_adminLevel: %1",_adminLevel];
	
	switch (_adminLevel) do {
			case 1: { _SAdmins = _SAdmins + [_playerId]; adminUIDs = adminUIDs + [_playerId];diag_log "Added to SA+EXT";}; 	//Super Admin Level + Special custom abilities
			case 2: { _SAdmins = _SAdmins + [_playerId]; diag_log "Added to SA";};		//Super Admin Level
			case 3: { _HAdmins = _HAdmins + [_playerId]; diag_log "Added to HA";};		//High Admin Level
			case 4: { _LAdmins = _LAdmins + [_playerId]; diag_log "Added to LA";};		//Low Admin Level
		};
	
} forEach _myArray;