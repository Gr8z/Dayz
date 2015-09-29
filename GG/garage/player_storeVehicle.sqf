private["_unit","_obj","_wogear","_charID","_objectID","_keyavailable","_keyColor","_added","_objectUID","_key"];
if (DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
if	(lbCurSel 3802 == -1) exitWith {hint  "No Vehicle selected"};
_unit = player;
_obj = StoreVehicleList select (lbCurSel 3802);
StoreVehicleList = nil;
_wogear = _this select 0;
closeDialog 0;

_debloyed = _obj getVariable["Deployed", false];
if (_debloyed) exitWith { cutText ["You cannot store deployed vehicles!","PLAIN DOWN"]; };

//Exploit fix
_GGsold = _obj getVariable["GGsold", false];
if (_GGsold) exitWith { cutText ["This vehicle is already sold","PLAIN DOWN"]; };

if !(local _obj and !isNull _obj and alive _obj) exitWith { cutText ["\n\nFailed, you must get into drivers seat first.","PLAIN DOWN"]; };

_charID	= _obj getVariable ["CharacterID","0"];
_objectID = _obj getVariable ["ObjectID","0"];
_objectUID	= _obj getVariable ["ObjectUID","0"];

_keyavailable = false;
_keyColor = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
if(_charID != "0") then {
{
	if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _keyColor) then {
	if (str(getNumber(configFile >> "CfgWeapons" >> _x >> "keyid")) == _charID) then {
	_key = _x; _keyavailable = true;
			};
		};
} count (items _unit);


} else {_keyavailable = true;};

if (!_keyavailable) exitWith {cutText ["You need the key of the vehicle.", "PLAIN DOWN"];};

_added = false;
if (!_wogear) then {
_added = [player, Pricegear] call SC_fnc_removeCoins;
} else {_added = true;};
Pricegear = nil;

if(!_added) exitWith {cutText ["You don't have enough money.", "PLAIN DOWN"];};

PVDZE_queryGarageVehicle = [player];
publicVariableServer "PVDZE_queryGarageVehicle";

cutText ["Requesting your garage Info....", "PLAIN DOWN"];

_obj setvehiclelock "locked";

waitUntil {!isNil "PVDZE_queryGarageVehicleResult"};

_vehicles = PVDZE_queryGarageVehicleResult;
PVDZE_queryGarageVehicleResult = nil;

if (getPlayerUID player in GarageDonor) then { GarageSlots = 6;} else {GarageSlots = 3; };

if	(count _vehicles < GarageSlots) then
{
	DZE_ActionInProgress = true;
	if(_charID != "0") then {
		[_unit,_key] call BIS_fnc_invRemove; cutText ["Key removed!", "PLAIN DOWN"];
	};

	

	_vehName = getText(configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");

	PVDZE_storeVehicle = [_obj, _unit, _wogear];
	publicVariableServer "PVDZE_storeVehicle";
	waitUntil {!isNil "PVDZE_storeVehicleResult"};

	PVDZE_obj_Delete = [_objectID,_objectUID,_unit];
	publicVariableServer "PVDZE_obj_Delete";

	deleteVehicle _obj;

	PVDZE_storeVehicleResult = nil;
	uiSleep 2;

	cutText [""+_vehName+" stored in your Garage!", "PLAIN DOWN"];

	DZE_ActionInProgress = false;
} else {
	if (getPlayerUID player in GarageDonor) then {
		cutText ["You cannot store more than 6 vehicles, your garage is full.", "PLAIN DOWN"];
	} else {
		cutText ["You cannot store anymore vehicles, your garage is full. Donate to get a 6 slot capacity", "PLAIN DOWN"];
	};	
};