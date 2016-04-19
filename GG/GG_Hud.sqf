#include "shortcuts.h"
disableSerialization;
while {true} do
{
1000 cutRsc ["AsReMixhud","PLAIN"];
_wpui = uiNameSpace xgv "AsReMixhud";
_vitals = _wpui displayCtrl 4900;
_thePlayer = player;
_cashMoney  = _thePlayer xgv["GGCoins",0];
_bankMoney  = _thePlayer xgv["GGBank",0];

_vitals ctrlSetStructuredText parseText format ["
	<img size='1.4' align='left' image='GG\GUI\Money.paa'/><t size='0.9'> %1 </t>   <br/>
	<img size='1.4' align='left' image='GG\GUI\Bank.paa'/><t size='0.9'> %2 </t>   <br/>",
	[_cashMoney] call BIS_fnc_numberText,
	[_bankMoney] call BIS_fnc_numberText
];

_vitals ctrlCommit 0;     
uiSleep 2;
};