/*
	Usage: [_crate,"type"] execVM "dir\DZMSBox.sqf";
		_crate is the crate to fill
		"type" is the type of crate
		"type" can be weapons or medical
*/
_crate = _this select 0;
_type = _this select 1;

// Clear the current cargo
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// Define lists. Some lists are defined in DZMSWeaponCrateList.sqf in the ExtConfig.
_bpackList = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
_gshellList = ["HandGrenade_west","HandGrenade_east","FlareWhite_M203"];
_shellList = ["HandGrenade_west","HandGrenade_east","FlareWhite_M203","RPG18","Stinger","Javelin"];
_medical = ["ItemBandage","ItemMorphine","ItemEpinephrine","ItemPainkiller","ItemWaterbottle","FoodMRE","ItemAntibiotic","ItemBloodbag"];
_money = ["ItemBriefcase100oz","ItemGoldBar","ItemGoldBar10oz","ItemSapphire", "ItemEmerald", "ItemCitrine", "ItemTopaz", "ItemAmethyst", "ItemObsidian", "ItemRuby"];
_GGSupply1 = ["ItemSodaCoke", "ItemSodaPepsi", "ItemSodaMdew", "ItemSodaR4z0r", "ItemSodaMtngreen", "ItemSodaClays", "ItemSodaSmasht", "ItemSodaDrwaste", "ItemSodaLemonade", "ItemSodalvg", "ItemSodaMzly", "ItemSodaRabbit", "ItemSodaRbull", "ItemSodaOrangeSherbet", "ItemWaterbottleUnfilled"];
_GGSupply2 = ["FoodCanBakedBeans", "FoodCanFrankBeans", "FoodCanPasta", "FoodCanSardines", "FoodMRE", "FoodPistachio", "FoodNutmix", "FoodCanGriff", "FoodCanBadguy", "FoodCanBoneboy", "FoodCanCorn", "FoodCanCurgon", "FoodCanDemon", "FoodCanFraggleos", "FoodCanHerpy", "FoodCanOrlok", "FoodCanPowell", "FoodCanTylers","FoodbaconCooked", "FoodbeefCooked", "FoodchickenCooked", "FoodmuttonCooked", "FoodrabbitCooked", "ItemTroutCooked", "ItemSeaBassCooked", "ItemTunaCooked"];
_GGSupply3 = ["RPG18","Stinger","Javelin","FHQ_ACR_WDL_TWS_SD","FHQ_ACR_WDL_TWS","FHQ_ACR_BLK_TWS_SD","FHQ_ACR_BLK_TWS","FHQ_ACR_TAN_TWS_SD","FHQ_ACR_TAN_TWS","FHQ_ACR_SNW_TWS_SD","FHQ_ACR_SNW_TWS","BAF_LRR_scoped","BAF_LRR_scoped_W","Mk_48_DZ","USSR_cheytacM200","USSR_cheytacM200_sd","FHQ_MSR_SD_DESERT","FHQ_MSR_DESERT","FHQ_MSR_NV_DESERT","FHQ_MSR_NV_SD_DESERT","m107_DZ","BAF_AS50_scoped","M110_NVG_EP1"];
_GGSupply4 = ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemToolbox","NVGoggles"];
//////////////////////////////////////////////////////////////////
// Supply Crates
if (_type == "GGSupply") then {
	// Load drinks
	_scount = count _GGSupply1;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _GGSupply1 select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
	// Load food
	_scount = count _GGSupply2;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _GGSupply2 select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
	// Load Weapons
	_scount = count _GGSupply3;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = _GGSupply3 select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
	};
	// Load Toolbelt Items
	_scount = count _GGSupply4;
	for "_x" from 0 to 5 do {
		_sSelect = floor(random _sCount);
		_item = _GGSupply4 select _sSelect;
		_crate addWeaponCargoGlobal [_item,(round(random 3))];
	};
	// Load Backpacks
	_scount = count _bpacklist;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _bpacklist select _sSelect;
		_crate addBackpackCargoGlobal [_item,(round(random 2))];
	};
	// Load Money
	_scount = count _money;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = _money select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
	// Load Medical
	_scount = count _medical;
	for "_x" from 0 to 25 do {
		_sSelect = floor(random _sCount);
		_item = _medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 3))];
	};
	// Load Shells
	_scount = count _shellList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = _shellList select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};
// Medical Crates
if (_type == "medical") then {
	// load medical
	_scount = count _medical;
	for "_x" from 0 to 40 do {
		_sSelect = floor(random _sCount);
		_item = _medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
};
///////////////////////////////////////////////////////////////////
// Weapon Crates
if (_type == "weapons") then {
	// load grenades
	_scount = count _gshellList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = _gshellList select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
   
	// load packs
	_scount = count _bpackList;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _bpackList select _sSelect;
		_crate addBackpackCargoGlobal [_item,1];
	};
	 
	// load pistols
	_scount = count DZMSpistolList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = DZMSpistolList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load sniper
	_scount = count DZMSsniperList;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = DZMSsniperList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 1))];
		};
	};

	//load mg
	_scount = count DZMSmgList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = DZMSmgList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 3))];
		};
	};

	//load primary
	_scount = count DZMSprimaryList;
	for "_x" from 0 to 4 do {
		_sSelect = floor(random _sCount);
		_item = DZMSprimaryList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 2))];
		};
	};
};

///////////////////////////////////////////////////////////////////
// Epoch Supply Crates
if (_type == "supply") then {
	// load tools
	_scount = count DZMSConTools;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConTools select _sSelect;
		_crate addWeaponCargoGlobal [_item, 1];
	};
	
	// load construction
	_scount = count DZMSConSupply;
	for "_x" from 0 to 30 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConSupply select _sSelect;
		_crate addMagazineCargoGlobal [_item,2];
	};
};

///////////////////////////////////////////////////////////////////
// Epoch Money Crates
if (_type == "money") then {
	// load money
	_scount = count _money;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _money select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};