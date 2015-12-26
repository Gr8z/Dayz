#include "shortcuts.h"
private ["_iPos","_tQty","_qty","_index","_weights","_cntWeights","_canType","_item","_magQty","_mags","_item2","_itemTypes","_max","_iItem","_iClass","_radius","_uniq","_iPosZ"];
_iItem = _this sel 0;
_iClass = _this sel 1;
_iPos = _this sel 2;
_radius = _this sel 3;
_uniq = [];

_item = objNull;

_iPosZ = _iPos sel 2;
if((isNil "_iPosZ") || {( _iPosZ < 0)}) then { _iPos = [_iPos sel 0,_iPos sel 1,0]; };
if (isNil "_iClass") exw {};
switch (_iClass) do {
	default {
		_itemTypes = [];
		{
			_itemTypes set [count _itemTypes, _x sel 0]
		} count getArray (missionConfigFile >> "cfgLoot" >> _iClass);
	
		_qty = 0;
		_max = ceil(random 2) + 1;
		if (_iClass in ["trash","civilian","office","office2","food","generic","medical","hospital","military","militarypilot","policeman","hunter","worker","militaryammo"]) then {
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			while {_qty < _max} do {
				_index = dayz_CLBase find _iClass;
				_weights = dayz_CLChances sel _index;
				_cntWeights = count _weights;

				_index = floor(random _cntWeights);
				_index = _weights sel _index;
				
				_canType = _itemTypes sel _index;
				_tQty = round(random 1) + 1;
				if (_canType in _uniq) then {
					if (({_x in _uniq} count magazines _item) == 0) then { _tQty = 1; } else { _tQty = 0;};
				};
				if (_tQty > 0) then {
					if (!(_canType in _uniq)) then {
						[_canType] call checkWepBpslot;
						_item addMagazineCargoGlobal [_canType,1];
						_uniq set [count _uniq, _canType];
						_qty = _qty + 1;
					};
				};
			};
			if ((_iItem != "") && (isClass(configFile >> "CfgWeapons" >> _iItem))) then {
				[_iItem] call checkWepBpslot;

				if (_iItem == "Chainsaw") then {
					_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
				};

				_item addWeaponCargoGlobal [_iItem,1];
			};
		}
		else {
			if (_iClass in ["ACRHighWeaps","ScarLowWeaps","ScarHighWeaps","SniperMedWeaps","RiflesMedWeaps","HK416Weaps","HK417Weaps","MasWeaps","G36Weaps","PistolTopWeaps","SVDWeaps","PistolMilWeaps","PistolsLow","SubWeaps","RiflesLowWeaps","SniperLowWeaps","AKLowWeaps","AKHighWeaps","LMGWeaps","L85Weaps","M4Weaps","M8Weaps","HMGWeaps","NVweaps","UltraWeaps","ShotgunWeaps","MeleeWeaps","SniperTopWeaps","RocketWeaps","TWSWeaps","LauncherWeaps"]) then {
				_index = dayz_CLBase find _iClass;
				if (_index > 0) then {
					_weights = dayz_CLChances sel _index;
					_cntWeights = count _weights;
					_index = floor(random _cntWeights);
					_index = _weights sel _index;
					_item2 = _itemTypes sel _index;

					if ((_item2 != "") && (isClass(configFile >> "CfgWeapons" >> _item2))) then {

						if (_iClass == "MeleeWeaps") then {

							if (_item2 == "Chainsaw") then {
								_item2 = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
							};

							_item = createVehicle["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
							_item addWeaponCargoGlobal[_item2, 1];

						} else {

							_item = createVehicle["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
							_item addWeaponCargoGlobal[_item2, 1];
							_mags = [] + getArray (configFile >> "cfgWeapons" >> _item2 >> "magazines");
							if ((count _mags) > 0) then{

								for "_x" from 1 to (round(random 3) + 1) do {
									_p2mag = "";
									
									_p2mag = [_item2,_mags,[false,false]] call randomMags;

									if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
									if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
									if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
									_item addMagazineCargoGlobal[_p2mag, 1];

									_p2mag = nil;
								};
							};
						};
					};
				};
			};
		};
		
	};
	case "single":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_itemTypes = [];
		{
			_itemTypes set[count _itemTypes, _x sel 0]
		} count getArray(missionConfigFile >> "cfgLoot" >> _iItem);
	
		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances sel _index;
		_cntWeights = count _weights;
			
	    _index = floor(random _cntWeights);
		_index = _weights sel _index;
		_canType = _itemTypes sel _index;
		[_canType] call checkWepBpslot;
		_item addMagazineCargoGlobal [_canType,1];

	};
	case "backpacks":
	{
		_itemTypes = [];
		_itemTypes = ((getArray (missionConfigFile >> "cfgLoot" >> _iItem)));

		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances sel _index;
		_cntWeights = count _weights;
		_index = floor(random _cntWeights);
		_index = _weights sel _index;
		_iItem = _itemTypes sel _index;
		_iItem = _iItem sel 0;

		_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];

	};
	case "militarybackpacks":
	{
		_itemTypes = [];
		_itemTypes = ((getArray (missionConfigFile >> "cfgLoot" >> _iItem)));

		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances sel _index;
		_cntWeights = count _weights;
		_index = floor(random _cntWeights);
		_index = _weights sel _index;
		_iItem = _itemTypes sel _index;
		_iItem = _iItem sel 0;

		_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];

	};
	case "tents":
	{
		_itemTypes = [];
		_itemTypes = ((getArray (missionConfigFile >> "cfgLoot" >> _iItem)));

		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances sel _index;
		_cntWeights = count _weights;
		_index = floor(random _cntWeights);
		_index = _weights sel _index;
		_iItem = _itemTypes sel _index;
		_iItem = _iItem sel 0;

		_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];

	};
	case "cfglootweapon":
	{
		_itemTypes = [];
		{
			_itemTypes set[count _itemTypes, _x sel 0]
		} count getArray(missionConfigFile >> "cfgLoot" >> _iItem);
	
		_index = dayz_CLBase find _iItem;
		_weights = dayz_CLChances sel _index;
		_cntWeights = count _weights;
			
	    _index = floor(random _cntWeights);
		_index = _weights sel _index;
		_iItem = _itemTypes sel _index;

		[_iItem] call checkWepBpslot;

		if (_iClass == "MeleeWeaps") then {
			if (_iItem == "Chainsaw") then {
				_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
			};
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item addWeaponCargoGlobal [_iItem,1];
		} else {
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item addWeaponCargoGlobal [_iItem,1];
			_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
			if ((count _mags) > 0) then{

				for "_x" from 1 to (round(random 3) + 1) do {
					private["_p2mag"];

					_p2mag = [_iItem,_mags,[false,false]] call randomMags;

					if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
					_item addMagazineCargoGlobal[_p2mag, 1];
				};
			};
		};
		
	};
	case "weapon":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call checkWepBpslot;

		if (_iClass == "MeleeWeaps") then {

			if (_iItem == "Chainsaw") then {
				_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
			};

			_item addWeaponCargoGlobal [_iItem,1];

		} else {
			_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
			if ((count _mags) > 0) then{

				for "_x" from 1 to (round(random 3) + 1) do {
					private["_p2mag"];

					_p2mag = [_iItem,_mags,[false,false]] call randomMags;

					if (_p2mag == "20Rnd_556x45_Stanag") then { _p2mag = "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36") then { _p2mag =  "30Rnd_556x45_Stanag"; };
					if (_p2mag == "30Rnd_556x45_G36SD") then { _p2mag =  "30Rnd_556x45_StanagSD"; };
					_item addMagazineCargoGlobal[_p2mag, 1];
				};
			};
		};
	};
	case "weaponnomags":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call checkWepBpslot;

		if (_iItem == "Chainsaw") then {
			_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
		};

		_item addWeaponCargoGlobal [_iItem,1];

	};
	case "magazine":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		[_iItem] call checkWepBpslot;
		_item addMagazineCargoGlobal [_iItem,1];
	};
	case "object": {
		[_iItem] call checkWepBpslot;

		if (_iItem == "Chainsaw") then {
			_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
		};

		_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];
		if ((count _iPos) > 2) then {
			_item setPosATL _iPos;
		};
	};
};
if (!izn(_item)) then{
	if ((count _iPos) > 2) then{
		_item setPosATL _iPos;
	};
};

_item
