#include "shortcuts.h"
private ["_zed","_killer","_kills","_array","_type","_humanity"];
 
_array =  _this sel 0;
_zed =  _array sel 0;
_killer =  _array sel 1;
_type =  _this sel 1;
 
if (local _zed) then {
_kills = _killer xgv[_type,0];
_killer xsv[_type,(_kills + 1),true];
_humanity = _killer xgv["humanity",0];
_humanity = _humanity + 5;
_killer xsv["humanity",_humanity,true];
_killCash = _killer xgv["GGCoins",0];
_killer xsv["GGCoins",(_killCash + 5),true];

};