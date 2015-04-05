private["_item","_msg","_config","_configName","_wepType","_isPistol","_secondaryWeapon","_isRifle","_isToolBelt","_isBinocs","_abort","_emptySlots","_free_magazine_slots","_added"];
if(lbCurSel 7802 == -1) exitWith {hint  "No Item selected"};
closeDialog 0;
_item = lbData[7802,(lbCurSel 7802)];
_item = (call compile format["%1",_item]);

// [id, classname, price, type]

if ((_item select 3) != 0) then {
	_msg = "";
	_config = (configFile >> "CfgWeapons" >> (_item select 1));
	_configName = configName(_config);
	_wepType = getNumber(_config >> "Type");
	_isPistol = (_wepType == 2);
	_isRifle = (_wepType == 1);
	_isToolBelt = (_wepType == 131072);
	_isBinocs = (_wepType == 4096);
	_abort = false;

	if (_isRifle) then {
		_abort = ((primaryWeapon player) != "");
		_msg = "You already have a primary!";
	};

	if (_isPistol) then {
		_secondaryWeapon = "";
		{
			if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Type")) == 2) exitWith {
					_secondaryWeapon = _x;
			};
		} count (weapons player);
		_abort = (_secondaryWeapon != "");
		_msg = "You already have a secondary!";
	};

	if(_isToolBelt || _isBinocs) then {
		_abort = (_configName in (weapons player));
		_msg = "Drop or sell your current toolbelt item before you can buy a new one.";
	};
} else {
	_emptySlots = [player] call BIS_fnc_invSlotsEmpty;
	_free_magazine_slots = _emptySlots select 4;

	if(_free_magazine_slots < 1) exitWith {
		cutText [(localize "STR_DAYZ_CODE_2"), "PLAIN DOWN"];
	};
};
if (_abort) exitWith { cutText [_msg, "PLAIN"];};

_added = [player, (_item select 2)] call SC_fnc_removeCoins;

if (_added) then {

	PVDZE_buyitem = [player, (_item select 0)]; // _item select 0 = id
	publicVariableServer "PVDZE_buyitem";

	waitUntil {!isNil "PVDZE_buyitemResult"};

	if ((_item select 3) != 0) then {
		player addWeapon (_item select 1);
		cutText [format["Weapon added to your inventory!"], "PLAIN"];	
	} else {
		player addMagazine (_item select 1);
		cutText [format["Item added to your inventory!"], "PLAIN"];	
	};


	PVDZE_buyitemResult = nil;
	PVDZE_queryStoreResult = nil;
	sleep 2;
	cutText ["Bought item.", "PLAIN DOWN"];
} else {
	cutText ["Not enough money", "PLAIN"];
};