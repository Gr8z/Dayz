	/* ----------------------------------------------------------------------------
	Examples:
	   _result = [_backpack, ["SmokeShell","M16_AMMO"],["M16","M16","M240"],["backpack1","backpack2"]] call ZUPA_fnc_removeWeaponsAndMagazinesCargo;
	   _result == [[1,0,0,1,1,1,0],[1,0,0,1],[1,0]]; // 1 = success, 0 = fail ->( item was not in cargo)

	Author:
	   Zupa 2014-09-30
	---------------------------------------------------------------------------- */
private ["_unitGG", "_items","_weaps","_normalItems","_normalWeaps", "_count", "_i", "_unitGG_allItems", "_unitGG_allItems_types", "_unitGG_allItems_count", "_item_type", "_item_count", "__returnVar"];
_unitGG = _this select 0;
_items = _this select 1;
_weaps = _this select 2;
_bags = [];
if(count _this > 3)then{
	_bags = _this select 3;
};

_normalItems = [];
_normalWeaps = [];
_normalBags = [];

_unitGG_allItems = getMagazineCargo _unitGG; //  [[type1, typeN, ...],[count1, countN, ...]]
_unitGG_allItems_types = _unitGG_allItems select 0;
_unitGG_allItems_count = _unitGG_allItems select 1;

_unitGG_allWeaps = getWeaponCargo _unitGG;
_unitGG_allWeaps_types = _unitGG_allWeaps select 0;
_unitGG_allWeaps_count = _unitGG_allWeaps select 1;

_unitGG_allBags = getBackpackCargo _unitGG;
_unitGG_allBags_types = _unitGG_allBags select 0;
_unitGG_allBags_count = _unitGG_allBags select 1;

clearMagazineCargoGlobal _unitGG;
clearWeaponCargoGlobal _unitGG;

if( count _bags > 0 )then{
	clearBackpackCargoGlobal  _unitGG;
};

{
	_counter = 0 ;
	while{	_counter < ( _unitGG_allItems_count select _forEachIndex)}do{
	_normalItems set [count(_normalItems),_x];
			_counter = _counter + 1;
	};
}forEach _unitGG_allItems_types;
{
	_counter = 0 ;
	while{	_counter < ( _unitGG_allWeaps_count select _forEachIndex)}do{
	_normalWeaps set [count(_normalWeaps),_x];
			_counter = _counter + 1;
	};
}forEach _unitGG_allWeaps_types;
{
	_counter = 0 ;
	while{	_counter < ( _unitGG_allBags_count select _forEachIndex)}do{
	_normalBagss set [count(_normalBags),_x];
			_counter = _counter + 1;
	};
}forEach _unitGG_allBags_types;

_returnVar = [];
_returnMag = [];
_returnWeap = [];
_returnBag = [];
{
	_inCargo = _normalItems find _x;
	if(_inCargo > -1)then{
		_normalItems set [_inCargo, "soldItem"];
		_returnMag set [count(_returnMag),1];
	}else{
		_returnMag set [count(_returnMag),0];
	};
}count _items;
_normalItems = _normalItems - ["soldItem"];
{
	_unitGG addMagazineCargoGlobal [_x, 1];
}count _normalItems;

{
	_inCargo = _normalWeaps find _x;
	if(_inCargo > -1)then{
		_normalWeaps set [_inCargo, "soldItem"];
		_returnWeap set [count(_returnWeap),1];
	}else{
		_returnWeap set [count(_returnWeap),0];
	};
}count _weaps;
_normalWeaps = _normalWeaps - ["soldItem"];
{
	_unitGG addWeaponCargoGlobal [_x, 1];
}count _normalWeaps;

{
	_inCargo = _normalBags find _x;
	if(_inCargo > -1)then{
		_normalBags set [_inCargo, "soldItem"];
		_returnBag set [count(_returnBag),1];
	}else{
		_returnBag set [count(_returnBag),0];
	};
}count _bags;
_normalWeaps = _normalWeaps - ["soldItem"];
{
	_unitGG addBackpackCargoGlobal [_x, 1];
}count _normalBags;

_returnVar set [0,_returnMag];
_returnVar set [1,_returnWeap];
_returnVar set [2,_returnBag];
_returnVar
