#include "cake.h"
tracking_keys = [];
{if (['ItemKey',_x] call fnc_inString) then {tracking_keys set [count tracking_keys,_x]}} forEach (items player);
if (count tracking_keys == 0) exw {
	_msg = ('No keys found in inventory!');
	systemChat ('(ArmA-AH): ' + str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
{
	_selected 	= _x;
	_found 		= false;
	{
		private ['_key','_id'];
		_id = parseNumber (_x xgv ['CharacterID','0']);
		if (_id != 0) then {
			_key = switch (true) do {
				default {''};
				case ((_id > 0)&&(_id <= 2500)) : {'ItemKeyGreen'+str _id};
				case ((_id > 2500)&&(_id <= 5000)) : {'ItemKeyRed'+str (_id - 2500)};
				case ((_id > 5000)&&(_id <= 7500)) : {'ItemKeyBlue'+str (_id - 5000)};
				case ((_id > 7500)&&(_id <= 10000)) : {'ItemKeyYellow'+str (_id - 7500)};
				case ((_id > 10000)&&(_id <= 12500)) : {'ItemKeyBlack'+str (_id - 10000)};
			};
			if (_key == _selected) then {
				_found = true;
				systemChat ("Found vehicle for key "+str _selected+"! Cordinates: "+str (mapGridPosition _x)+" Type: "+typeOf _x);
			};
		};
	} forEach ((allMissionObjects 'LandVehicle')+(allMissionObjects 'Ship')+(allMissionObjects 'Air'));
	if !(_found) then {
		systemChat ("Vehicle for key "+str _selected+" has been destroyed! Key has been deleted.");
		player removeWeapon _selected;
	};
} forEach tracking_keys;
