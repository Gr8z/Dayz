#include "Epoch\shortcuts.h"
if (visibleMap || (!izn (findDisplay 88890))) then {
	{
		if ((!izn _x) && {isPlayer _x} && {(driver (vehicle _x)) == _x}) then {
			_name = name _x;
			if ((group _x == group player) && (_name != name player)) then {
				_pPos = getPosATL _x;
				if (surfaceIsWater _pPos) then {_pPos = getPosASL _x;};
				deleteMarkerLocal _name;
				_mrkr = createMarkerLocal [_name,_pPos];
				_mrkr setMarkerTypeLocal "DestroyedVehicle";
				_mrkr setMarkerTextLocal fmt ["%1",_name];
			} else {
				deleteMarkerLocal _name;
			};
		};
	} count playableUnits;
	
	{
		if (!izn _x) then {
			_name = _x xgv["bodyName","unknown"];
			if (_name == name player) then {_name = " RIP";};
			_pPos = getPosATL _x;
			_nameID = _name + str(_pPos);
			if (_name == " RIP") then {
				deleteMarkerLocal _nameID;
				_mrkr = createMarkerLocal [_nameID,_pPos];
				_mrkr setMarkerTypeLocal "DestroyedVehicle";
				_mrkr setMarkerTextLocal fmt ["%1",_name];
				_mrkr setMarkerColorLocal "ColorRed";
			} else {
				deleteMarkerLocal _nameID;
			};
		};
	} count allDead;
};