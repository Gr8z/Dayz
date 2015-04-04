private["_unit","_item","_selllist1","_selllist2","_type","_displayName","_dialog"];
if(lbCurSel 8802 == -1) exitWith {hint  "No Item selected"};
_unit = player;
_item = SellItemList select (lbCurSel 8802);
_userprice = _this select 0;

_userprice = parseNumber _userprice;
// _class == _item
_selllist1 = SellItemList1;
SellItemList1 = nil;
SellItemList = nil;

closeDialog 0;

_type = 0;
if ((_item) in _selllist1) then {
	_type = 1;
};

if !((_item in magazines player) || (_item in weapons player)) exitWith {cutText ["Can not sell an item you do not have", "PLAIN DOWN"];}; // if still there

CurrencyDialogFetchData = {
	_displayName = "";
	if (_type == 0) then {
		_displayName = getText(configFile >> "CfgMagazines" >> _item >> "displayName");
	} else {
		_displayName = getText(configFile >> "CfgWeapons" >> _item >> "displayName");
	};
	ctrlSetText [15006, format["Item: %1", _displayName]];
};



if !((_item in magazines player) || (_item in weapons player)) exitWith {cutText ["Can not sell an item you dont have", "PLAIN DOWN"];}; // if still there


if (_userprice <= 0) exitWith {

	cutText ["You can not sell something for nothing!", "PLAIN DOWN"];

}; //make sure its positive

[_unit,_item] call BIS_fnc_invRemove; 
cutText ["Item added to the Auctionhouse!", "PLAIN DOWN"];


PVDZE_sellItem = [_item, player, _userprice, _type];
publicVariableServer "PVDZE_sellItem";

waitUntil {!isNil "PVDZE_sellItemResult"};

if (!PVDZE_sellItemResult) exitWith {
	cutText ["There was an error. Your Item has not been stored.", "PLAIN DOWN"];
};

cutText ["Item can now be bought by other players, come back later to claim your money.", "PLAIN DOWN"];

PVDZE_sellItemResult = nil;
PVDZE_sellItem = nil;
userprice = nil;
sleep 2;

