private["_mags","_weps","_item","_control","_displayName","_class"];

player removeAction s_auction_dialog2;
s_auction_dialog2 = -1;
player removeAction s_auction_dialog;
s_auction_dialog = -1;
player removeAction s_auction_claim;
s_auction_claim = -1;

createDialog "item_store_list";
disableSerialization;
_mags = magazines player;
_weps = weapons player;
_item = _weps + _mags;
SellItemList1 = _weps;

ctrlShow[8803,false];
ctrlShow[8830,false];
waitUntil {!isNull (findDisplay 8800)};
//diag_log format["%1",(magazines player)];
//diag_log format["%1",(weapons player)];
if(count _item == 0) exitWith
{
	ctrlSetText[8811,"No Items"];
};

_control = ((findDisplay 8800) displayCtrl 8802);
lbClear _control;


SellItemList = [];

{
	_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');
	_control lbAdd _displayName;
	_control lbSetData [(lbSize _control)-1,_x];
	SellItemList set [count SellItemList,_x];

} forEach (magazines player);

{
	_displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
	_control lbAdd _displayName;
	_control lbSetData [(lbSize _control)-1,_x];
	SellItemList set [count SellItemList,_x];

} forEach (_weps);


ctrlShow[8810,false];
ctrlShow[8811,false];