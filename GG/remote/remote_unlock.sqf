private ["_ownerID","_objects","_i","_ownerID2","_vehicle"];
_ownerID = _this select 0;
_objects = nearestObjects [getPos player, ["LandVehicle","Helicopter","Plane","Ship"], 50];
_i = 0;
{
	_vehicle = _x;
	if (alive _vehicle) then {
		_ownerID2 = _vehicle getVariable ["CharacterID", "0"];
		
		if(_ownerID == _ownerID2) then {
			if(locked _vehicle) then {
				if(player distance _vehicle < 50) then {
					DZE_ActionInProgress = true;
					{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
					s_player_lockUnlock_crtl = 1;
					PVDZE_veh_Lock = [_vehicle,false];
					if (local _vehicle) then {
						PVDZE_veh_Lock spawn local_lockUnlock
					} else {
						publicVariable "PVDZE_veh_Lock";
					};
					(findDisplay 106) closedisplay 0;
					titleText ["Vehicle has been unlocked","PLAIN DOWN"];
					
					s_player_lockUnlock_crtl = -1;
					DZE_ActionInProgress = false;
				} else {
					titleText ["You need to be 50m near the vehicle","PLAIN DOWN"];
				};
			};
		};
		
		_i = _i + 1;
	};
} forEach _objects;