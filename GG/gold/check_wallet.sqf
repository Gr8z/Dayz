private ["_body", "_hisMoney", "_myMoney", "_killsH", "_test2", "_headShots", "_test","_playeridke","_humanity"];
_body = _this select 3;
_name = _body getVariable ["bodyName","AI"];
_hisMoney = _body getVariable ["cashMoney",0];
_myMoney = player getVariable ["cashMoney",0];
_myMoney = _myMoney + _hisMoney;

if (_hisMoney = 0) exitWith {systemChat format ['%2 has no coins',_hisMoney,_name];};
systemChat format ['You took %1 coins from %2 !',_hisMoney,_name];

sleep 1;

_body setVariable ["cashMoney", 0 , true];
player setVariable ["cashMoney", _myMoney , true];

sleep 2;

_myMoneyAfter = player getVariable ["cashMoney",0];
if(_myMoneyAfter > 0) then{
}else {
	player setVariable ["cashMoney", 0 , true];
	systemChat "YOU ARE BUGGED! RELOG NOW !	";
};
