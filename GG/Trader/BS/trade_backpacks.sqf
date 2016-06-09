private ["_msg","_activatingPlayer","_trade_item","_currency","_price","_BoS","_textPart","_bag","_qty","_trader","_num_removed","_myMoney","_needed","_qty_in"];
if (DZE_ActionInProgress) exitWith {
	_msg = "Trade already in progress.";
	systemChat ("Server: "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
DZE_ActionInProgress = true;
_activatingPlayer = player;

_trade_item = _this select 0;
_currency 	= _this select 1;
_price 		= _this select 2;
_BoS 		= _this select 3;
_textPart 	= _this select 4;
_bag 		= typeOf(unitBackpack player);
if ((_bag != _trade_item)&&(_BoS == "sell")) exitWith {
	_msg = format ["You do not have a %1 to sell!",_textPart];
	systemChat ("Server: "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade;
};
if (_BoS == "buy") then {_qty = player getVariable ["GGCoins",0]} else {_qty = 0};
if (((_qty >= _price)&&(_BoS == "buy"))||((_bag == _trade_item)&&(_BoS == "sell"))) then {
	if (_BoS == "buy") then {
		_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
		//PVOZ_tradeshit = [player,_trader,_BoS,_trade_item,_price];publicVariableServer "PVOZ_tradeshit";
		player setVariable ["GGCoins", (_qty - _price) , true];
		_num_removed = _qty - (player getVariable ["GGCoins",0]);
		_msg = format ["Bought %1 for %2 %3!",_trade_item,_num_removed, GCoins];
		_msg call AH_fnc_dynTextMsg;
		if (_num_removed == _price) then {
			removeBackpack player;
			player addBackpack _trade_item;
		};
	} else {
		if (_bag== _trade_item) then {
			_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
			//PVOZ_tradeshit = [player,_trader,_BoS,_trade_item,_price];publicVariableServer "PVOZ_tradeshit";
			removeBackpack player;
			_myMoney = player getVariable ["GGCoins",0];
			_myMoney = _myMoney + _price;
			player setVariable ["GGCoins", _myMoney , true];
			
			_msg = format ["Sold %1 for %2 %3!",_bag,_price, GCoins];
			_msg call AH_fnc_dynTextMsg;
		};
	};
	{player removeAction _x} forEach s_player_parts;s_player_parts = [];
	s_player_parts_crtl = -1;
} else {
	_needed =  _qty_in - _qty;
	_msg = format ["You need another %1 %2",_needed,_textPart];
	systemChat ("Server: "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
call TraderFinishTrade;