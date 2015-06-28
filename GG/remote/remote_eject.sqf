private ["_ownerID","_objects","_i","_ownerID2","_vehicle"];
_ownerID = _this select 0;
_objects = nearestObjects [getPos player, ["LandVehicle","Helicopter","Plane","Ship"], 50];
_i = 0;
{
	_vehicle = _x;
	if (alive _vehicle) then {
		_ownerID2 = _vehicle getVariable ["CharacterID", "0"];
		
		if(_ownerID == _ownerID2) then {
				if(player distance _vehicle < 100) then {
					DZE_ActionInProgress = true;

					{
					_x action ["eject", (vehicle _vehicle)];
                    } forEach (crew _vehicle);
					
					(findDisplay 106) closedisplay 0;
					titleText ["Vehicle crew has been ejected","PLAIN DOWN"];

					DZE_ActionInProgress = false;
				};
		};
		
		_i = _i + 1;
	};
} forEach _objects;