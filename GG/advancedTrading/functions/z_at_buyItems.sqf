private ["_magazinesToBuy", "_weaponsToBuy", "_backpackGGsToBuy", "_toolsToBuy", "_sidearmToBuy", "_primaryToBuy", "_priceToBuy"
,"_enoughMoney", "_myMoney", "_canBuy", "_moneyInfo","_count","_success","_backpackGG"
];

_magazinesToBuy = 0;
_weaponsToBuy = 0;
_backpackGGsToBuy = 0;
_toolsToBuy = 0;
_sidearmToBuy = 0;
_primaryToBuy = 0;
_vehiclesToBuy = 0;

_priceToBuy = 0;

if (SingleCurrency) then {
	{
		if( _x select 1 == "trade_weapons")then{
			_parentClasses =  [(configFile >> "CfgWeapons" >> (_x select 0)),true] call BIS_fnc_returnParents;
			if( 'ItemCore' in _parentClasses || 'Binocular' in _parentClasses) then {
				_toolsToBuy = _toolsToBuy + (_x select 9);
			} else {
				_weaponsToBuy = _weaponsToBuy + (_x select 9);
				if('PistolCore' in _parentClasses)then {
					_sidearmToBuy = _sidearmToBuy + (_x select 9);
				} else {
					_primaryToBuy = _primaryToBuy + (_x select 9);
				};
			};
			_priceToBuy	= _priceToBuy + ((_x select 9)*(_x select 2));
		};
		if( _x select 1 == "trade_items")then{
			_magazinesToBuy = _magazinesToBuy + (_x select 9) ;
			_priceToBuy	= _priceToBuy + ((_x select 9)*(_x select 2));
		};
		if( _x select 1 == "trade_backpackGGs")then{
			_backpackGGsToBuy = _backpackGGsToBuy + (_x select 9) ;
			_priceToBuy	= _priceToBuy + ((_x select 9)*(_x select 2));
		};
		if( _x select 1 == "trade_any_vehicle")then{
			_vehiclesToBuy = _vehiclesToBuy + (_x select 9) ;
			_priceToBuy	= _priceToBuy + ((_x select 9)*(_x select 2));
		};
	} count Z_BuyingArray;
} else {
	{
		if( _x select 1 == "trade_weapons")then{
			_parentClasses =  [(configFile >> "CfgWeapons" >> (_x select 0)),true] call BIS_fnc_returnParents;
			if( 'ItemCore' in _parentClasses || 'Binocular' in _parentClasses) then {
				_toolsToBuy = _toolsToBuy + (_x select 9);
			} else {
				_weaponsToBuy = _weaponsToBuy + (_x select 9);
				if('PistolCore' in _parentClasses)then {
					_sidearmToBuy = _sidearmToBuy + (_x select 9);
				} else {
					_primaryToBuy = _primaryToBuy + (_x select 9);
				};
			};
			_priceToBuy	= _priceToBuy + ((_x select 11)*(_x select 2)*(_x select 9));
		};
		if( _x select 1 == "trade_items")then{
			_magazinesToBuy = _magazinesToBuy + (_x select 9) ;
			_priceToBuy	= _priceToBuy + ((_x select 11) *(_x select 2)*(_x select 9));
		};
		if( _x select 1 == "trade_backpackGGs")then{
			_backpackGGsToBuy = _backpackGGsToBuy + (_x select 9) ;
			_priceToBuy	= _priceToBuy + ((_x select 11)*(_x select 2)*(_x select 9));
		};
		if( _x select 1 == "trade_any_vehicle")then{
			_vehiclesToBuy = _vehiclesToBuy + (_x select 9) ;
			_priceToBuy	= _priceToBuy + ((_x select 11)*(_x select 2)*(_x select 9));
		};
	} count Z_BuyingArray;
};

_canBuy = [_weaponsToBuy,_magazinesToBuy,_backpackGGsToBuy,_toolsToBuy, _sidearmToBuy, _primaryToBuy,_vehiclesToBuy] call Z_allowBuying;

_myMoney = player getVariable[MoneyVariable,0];

_enoughMoney = false;

_moneyInfo = [false, [], [], [], 0];

if (SingleCurrency) then {
	if (_myMoney >= _priceToBuy) then {
		_enoughMoney = true;
	} else {
		_enoughMoney = false;
	};
} else {
	_moneyInfo = _priceToBuy call Z_canAfford;
	_enoughMoney = _moneyInfo select 0;
};

if(_enoughMoney) then {
	if(_canBuy) then {
	systemChat format["Starting trade."];

	closeDialog 2;

		if(Z_SellingFrom == 0) then {
		_backpackGG = unitBackpack player;
		systemChat format["Adding %1 items in backpack",count (Z_BuyingArray)];
			{
				if( _x select 1 == "trade_weapons")then{
					_backpackGG addWeaponCargoGlobal [_x select 0, _x select 9];
					diag_log format ["%1 x %2 added", _x select 0, _x select 9];
				};
				if( _x select 1 == "trade_items")then{
					_backpackGG addMagazineCargoGlobal  [_x select 0, _x select 9];
					diag_log format ["%1 x %2 added", _x select 0, _x select 9];
				};
			} count Z_BuyingArray;
		};

		if(Z_SellingFrom == 1)then{
			{
				systemChat format["Adding %1 items in %2",count (Z_BuyingArray), typeOf Z_vehicleGG];
				if( _x select 1 == "trade_weapons")then{
					Z_vehicleGG addWeaponCargoGlobal [_x select 0, _x select 9];
					diag_log format ["%1 x %2 added", _x select 0, _x select 9];
				};
				if( _x select 1 == "trade_items")then{
					Z_vehicleGG addMagazineCargoGlobal [_x select 0, _x select 9];
					diag_log format ["%1 x %2 added", _x select 0, _x select 9];
				};
				if( _x select 1 == "trade_backpackGGs")then{
					Z_vehicleGG addBackpackCargoGlobal [_x select 0, _x select 9];
					diag_log format ["%1 x %2 added", _x select 0, _x select 9];
				};
			} count Z_BuyingArray;
		};

		if(Z_SellingFrom == 2)then{
			systemChat format["Adding %1 items in gear",count (Z_BuyingArray)];
			{
				if( _x select 1 == "trade_weapons") then {
					_count = 0;
					while{ _count < (_x select 9)}do{
						player addWeapon (_x select 0);
						diag_log format ["%1 added", _x select 0];
						_count = _count + 1;
					};
				};
				if( _x select 1 == "trade_items" ) then {
					_count = 0;
					 while{ _count < (_x select 9)} do {
						player addMagazine (_x select 0);
						diag_log format ["%1 added", _x select 0];
						_count = _count + 1;
					};
				};
				if( _x select 1 == "trade_backpackGGs")then{
						player addBackpack (_x select 0);
				};
			} count Z_BuyingArray;
		};
		if (!SingleCurrency) then {
				_success = [player,_priceToBuy, _moneyInfo] call Z_payDefault;
				if (_success) then {
					systemChat format["Trade successful, paid %1 worth of items.", _priceToBuy];
				} else {
					systemchat "DEBUG: Something went wrong in the pay process. Please report this issue.";
				};
		} else {
				_success = [player,_priceToBuy] call SC_fnc_removeCoins;
				if (_success) then {
					systemChat format["Trade successful, paid %1 %2.", _priceToBuy, CurrencyName];
				} else {
					systemchat "DEBUG: Something went wrong in the pay process. Please report this issue.";
				};
		};
	} else {
		systemChat "You could not buy these items because the container lacks space to hold them.";
	};
}else{
	if( SingleCurrency) then {
		systemChat format["You need %1 %2 to buy all these items.",_priceToBuy,CurrencyName];
	} else {
		systemChat format["You need more money to buy all these items."];
	};
};
