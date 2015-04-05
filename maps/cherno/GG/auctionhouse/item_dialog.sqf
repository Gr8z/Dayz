private["_items","_control","_displayName","_tmp"];

player removeAction s_auction_dialog2;
s_auction_dialog2 = -1;
player removeAction s_auction_dialog;
s_auction_dialog = -1;
player removeAction s_auction_claim;
s_auction_claim = -1;

createDialog "itemstore";
disableSerialization;


ctrlShow[7803,false];
ctrlShow[7830,false];
waitUntil {!isNull (findDisplay 7800)};


PVDZE_getStoreitems = [player];
publicVariableServer "PVDZE_getStoreitems";

// [[id, classname, price, type],[id, classname, price, type]..]
waitUntil {!isNil "PVDZE_queryStoreResult"};

_items = PVDZE_queryStoreResult;
PVDZE_queryStoreResult = nil;

if(count _items == 0) exitWith
{
	ctrlSetText[7811,"No Items"];
};

_control = ((findDisplay 7800) displayCtrl 7802);
lbClear _control;

{
	if ((_x select 3) == 0) then {
		_displayName = getText(configFile >> "CfgMagazines" >> (_x select 1) >> "displayName");
	} else {
		_displayName = getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName");
	};
	_displayName = _displayName + " (For: " + str(_x select 2) + ")";
	_control lbAdd _displayName;
	_tmp = str(_x);
	_control lbSetData [(lbSize _control)-1,_tmp];
} count _items;

ctrlShow[7810,false];
ctrlShow[7811,false];
