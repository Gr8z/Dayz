private ["_body", "_hisMoney", "_myMoney", "_killsH", "_test2", "_headShots", "_test","_playeridke","_humanity"];
_body = _this select 3;
_name = _body getVariable ["bodyName","AI"];
_hisMoney = _body getVariable ["cashMoney",0];
_myMoney = player getVariable ["cashMoney",0];
_myMoney = _myMoney + _hisMoney;
_body setVariable ["cashMoney", 0 , true];

if(_hisMoney > 999999) exitWith { cutText ["You can not loot more then 999,999 gold coins at once.", "PLAIN DOWN"]; };

_PlayerNear = _body call dze_isnearest_player;
if (_PlayerNear) exitWith {cutText [localize "str_pickup_limit_4", "PLAIN DOWN"]};

if (_hisMoney == 0) exitWith {
	systemChat format ['%2 has no coins',_hisMoney,_name];
};

if (typeName (_myMoney) == "SCALAR")then{
    player setVariable ["cashMoney", _myMoney , true];
};

systemChat format ['You took %1 coins from %2 !',_hisMoney,_name];