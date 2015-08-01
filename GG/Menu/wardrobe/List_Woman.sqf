#include "dialog\definitions.sqf"
disableSerialization;

#include "Clothing_Woman.sqf";

_display = findDisplay SKINS_DIALOG;
_unitlist = _display displayCtrl SKINS_UNITLIST;
_queuelist = _display displayCtrl SKINS_QUEUE;

_queuelist ctrlSetText format["Donator Wardrobe"];


_weaponstring = "";
{
	_displname = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	_picture = getText (configFile >> "CfgVehicles" >> _x >> "portrait");
	_weaponstring = format["%1",_displname,_picture];
	_unitlist lbAdd _weaponstring;
} foreach Woman_Clothing;