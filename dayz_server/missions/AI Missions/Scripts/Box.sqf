_crate = _this select 0;
_type = _this select 1;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

/* Crate that is at every mission */
if (_type == "MainBox") then {
	// Loading Drinks
	_scount = count Drinks;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = Drinks select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 3))];
	};
	// Loading Food
	_scount = count Food;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = Food select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 3))];
	};
	// Loading Building Supplies
	_scount = count BuildingSupplies;
	for "_x" from 0 to 5 do {
		_sSelect = floor(random _sCount);
		_item = BuildingSupplies select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 3))];
	};
	// Loading Medical
	_scount = count Medical;
	for "_x" from 0 to 6 do {
		_sSelect = floor(random _sCount);
		_item = Medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 7))];
	};
	// Loading Guns
	_scount = count CrateGuns;
	for "_x" from 0 to 10 do {
		_sSelect = floor(random _sCount);
		_item = CrateGuns select _sSelect;
		_crate addWeaponCargoGlobal [_item,(round(random 2))];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 5))];
		};
	};
	// Loading Toolbelt Items
	_scount = count ToolbeltItems;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = ToolbeltItems select _sSelect;
		_crate addWeaponCargoGlobal [_item,(round(random 2))];
	};
	// Loading Currency Rewards
	_scount = count CurrencyItems;
	_sSelect = floor(random _sCount);
	_item = CurrencyItems select _sSelect;
	_crate addMagazineCargoGlobal [_item,1];
	// Loading High Value Items
	_scount = count HighValueItems;
	_sSelect = floor(random _sCount);
	_item = HighValueItems select _sSelect;
	_crate addMagazineCargoGlobal [_item,1];
};

/* Weapons Boxes */
if (_type == "WeaponsBox") then {
	// Loading Guns
	_scount = count CrateGuns;
	for "_x" from 0 to 25 do {
		_sSelect = floor(random _sCount);
		_item = CrateGuns select _sSelect;
		_crate addWeaponCargoGlobal [_item,(round(random 2))];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 5))];
		};
	};
	// Loading High Value Weapons
	_scount = count Special;
	_sSelect = floor(random _sCount);
	_item = Special select _sSelect;
	_crate addWeaponCargoGlobal [_item,1];
};