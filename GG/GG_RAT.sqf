if (vehicle player == player) exitWith {systemChat ("You are not in a vehicle.")};
RearmTargetVehicle = (vehicle player);
createDialog "AH_RAT";
RAT_array = [];
_tinfo = RearmTargetVehicle call GG_getTurretInfo;
if (count _tinfo > 0) then {
	lbClear 1500;
	{
		_wep = _x select 0;
		_mgs = _x select 1;
		_pos = _x select 2;
		_dis = _x select 3;
		if !((RearmTargetVehicle isKindOf "AIR")&&(_pos select 0 > -1)) then {
			{
				_mag = _x;
				_prc = (getNumber (missionConfigFile >> "CfgTraderAmmo" >> _mag >> "price"));
				_mis = (getText (configFile >> "CfgMagazines" >> _mag >> "displayName"));
				RAT_array set [count RAT_array,[RearmTargetVehicle,_wep,_mag,_dis,_prc,_pos,_mis]];
				_index = (if (_mis != "") then [{lbAdd [1500,format["%1 (%2)",_mis,_mag]]},{lbAdd [1500,format["%1",_mag]]}]);
				lbSetColor [1500, _index, [0, 0.5, 0, 1]];
			} forEach _mgs;
		};
	} forEach _tinfo;
} else {
	_index = lbAdd [1500,"No ammo for this vehicle."];
	lbSetColor [1500, _index, [1, 0, 0, 1]];
	((findDisplay 710420) displayCtrl 1600) ctrlEnable false;
};