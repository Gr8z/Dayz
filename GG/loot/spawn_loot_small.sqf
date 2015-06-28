
private ["_iItem","_iClass","_iPos","_radius","_item","_itemTypes","_index","_weights","_cntWeights","_canType","_dateNow"];

_iItem = 	_this select 0;
_iClass = 	_this select 1;
//diag_log format["DEBUG spawn loot class: %1", _iClass];
_iPos =		_this select 2;
_radius =	_this select 3;

_item = objNull;

switch (_iClass) do
{
	default
	{
		//Item is sigle, add 1 item from CfgLootSmall
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_itemTypes = [];

		{
			_itemTypes set[count _itemTypes, _x select 0];
		} count getArray(missionConfigFile >> "CfgLootSmall" >> _iClass);
		

		_index = dayz_CLBase find _iClass;
		_weights = dayz_CLChances select _index;
		_cntWeights = count _weights;
		_index = floor(random _cntWeights);
		_index = _weights select _index;
		_canType = _itemTypes select _index;


		_canType = _itemTypes select _index;
		[_canType] call checkWepBpslot;

		if (!isNil '_canType') then {
			if (_iClass in ["ACRHighWeaps","ScarLowWeaps","ScarHighWeaps","SniperMedWeaps","RiflesMedWeaps","HK416Weaps","HK417Weaps","MasWeaps","G36Weaps","PistolTopWeaps","SVDWeaps","PistolMilWeaps","PistolsLow","SubWeaps","RiflesLowWeaps","SniperLowWeaps","AKLowWeaps","AKHighWeaps","LMGWeaps","L85Weaps","M4Weaps","M8Weaps","HMGWeaps","NVweaps","UltraWeaps","ShotgunWeaps","MeleeWeaps","SniperTopWeaps","RocketWeaps","TWSWeaps","LauncherWeaps"]) then {
				
				if (_iClass == "MeleeWeaps") then {
					if (_canType == "Chainsaw") then {
						_canType = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
					};
					_item addWeaponCargoGlobal [_canType,1];

				} else {
					_item addWeaponCargoGlobal [_canType,1];
					_mags = [] + getArray (configFile >> "cfgWeapons" >> _canType >> "magazines");
					if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: Weapon: %1", _canType]; };
					if ((count _mags) > 0) then{

						for "_x" from 1 to (round(random 3) + 1) do {
							_p2mag = "";

							_p2mag = [_canType,_mags,[false,false]] call randomMags;

							if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
							if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
							if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
							_item addMagazineCargoGlobal[_p2mag, 1];

							_p2mag = nil;
						};
					};
				};
			} else {
				if ((_canType != "") && (isClass(configFile >> "CfgWeapons" >> _canType))) then {

					if (_canType == "Chainsaw") then {
						_canType = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
					};

					_item addWeaponCargoGlobal [_canType,1];

					if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: defaultClass: wep %1", _canType]; };
				} else {
					_item addMagazineCargoGlobal [_canType,1];
					if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: defaultClass: mag %1", _canType]; };

				};

			};
		};
	};
	case "single":
	{
		//Item is sigle, add 1 item from CfgLootSmall
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];

		_itemTypes = [];

		{
				_itemTypes set[count _itemTypes, _x select 0]
		} count getArray(missionConfigFile >> "CfgLootSmall" >> _iItem);
		_index = dayzE_CLSBase find _iItem;

		_weights = dayzE_CLSChances select _index;
		_cntWeights = count _weights;
			
	    _index = floor(random _cntWeights);
		_index = _weights select _index;
		_canType = _itemTypes select _index;
		[_iItem] call checkWepBpslot;
		_item addMagazineCargoGlobal [_canType,1];
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: single: %1", (_canType)]; };
	};
	case "cfglootweapon":
	{
		//Item is sigle, add 1 item from cfgloot
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];

		_itemTypes = [];
		{
			_itemTypes set[count _itemTypes, _x select 0]
		} count getArray(missionConfigFile >> "CfgLootSmall" >> _iItem);
	
		_index = dayzE_CLSBase find _iItem;
		_weights = dayzE_CLSChances select _index;
		_cntWeights = count _weights;
	
		//diag_log("_itemTypes small:" + str(_itemTypes));

	    _index = floor(random _cntWeights);
		_index = _weights select _index;
		_iItem = _itemTypes select _index;

		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call checkWepBpslot;
		_item addWeaponCargoGlobal [_iItem,1];
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: cfglootweapon: %1", (_iItem)]; };
		
	};
	case "weapon":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call checkWepBpslot;
		_item addWeaponCargoGlobal [_iItem,1];
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: weapon: %1", (_iItem)]; };
	};
	case "magazine":
	{
		//Item is one magazine
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call checkWepBpslot;
		_item addMagazineCargoGlobal [_iItem,1];
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: magazine: %1", (_iItem)]; };
	};
	
	case "weaponnomags":
	{
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: weaponnomags: %1", (_iItem)]; };
		//do nothing for now
	};
	case "backpack":
	{
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: backpack: %1", (_iItem)]; };
		//do nothing for now
	};
	case "object":
	{
		if (P2DZE_debugLoot) then { diag_log format["P2DEBUG spawn_loot_small: object: %1", (_iItem)]; };
		//do nothing for now
	};
};
if (!isNull(_item)) then{
	if ((count _iPos) > 2) then{
		_item setPosATL _iPos;
	};
};

_item