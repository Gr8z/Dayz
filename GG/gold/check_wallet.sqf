private ["_body", "_hisMoney", "_myMoney", "_killsH", "_test2", "_headShots", "_test","_playeridke","_humanity"];
_body = _this select 3;
_name = _body getVariable ["bodyName","AI"];
_hisMoney = _body getVariable ["cashMoney",0];
_myMoney = player getVariable ["cashMoney",0];
_myMoney = _myMoney + _hisMoney;
_body setVariable ["cashMoney", 0 , true];

if (DZE_ActionInProgress) exitWith {};

player removeAction s_player_studybody;
s_player_studybody = -1;

DZE_ActionInProgress=true;

if(_hisMoney > 999999) exitWith { cutText ["You can not loot more then 999,999 gold coins at once.", "PLAIN DOWN"];DZE_ActionInProgress=false; };

if (isNull cursorTarget) exitWith {
	cutText ["Cannot loot coins, You must be near a body to loot coins.", "PLAIN DOWN"];
	DZE_ActionInProgress=false;
};


_PlayerNear = _body call dze_isnearest_player;
if (_PlayerNear) exitWith {DZE_ActionInProgress=false; cutText [localize "str_pickup_limit_4", "PLAIN DOWN"]};

if (_hisMoney == 0) exitWith {
	systemChat format ['%2 has no coins',_hisMoney,_name];
	DZE_ActionInProgress=false;
};

if (typeName (_myMoney) == "SCALAR")then{
    player setVariable ["cashMoney", _myMoney , true];
};

DZE_ActionInProgress=false;

systemChat format ['You took %1 coins from %2 !',_hisMoney,_name];