private["_claimLastUsedTime","_claimTime","_money"];

player removeAction s_auction_dialog2;
s_auction_dialog2 = -1;
player removeAction s_auction_dialog;
s_auction_dialog = -1;
player removeAction s_auction_claim;
s_auction_claim = -1;


_claimLastUsedTime = 300;
if (isNil "lastclaim") then {
	lastclaim = time - _claimLastUsedTime;
};

_claimTime = time - lastclaim; //cooldown

if(_claimTime < _claimLastUsedTime) exitWith {
	cutText [format["You can not claim your money that often, please wait %1!",(_claimTime - _claimLastUsedTime)], "PLAIN DOWN"];
};

PVDZE_claimmoney = [player];
publicVariableServer "PVDZE_claimmoney";

waitUntil {!isNil "PVDZE_claimmoneyResult"};

_money = player getVariable ["cashMoney",0];

player setVariable ["cashMoney",(money+PVDZE_claimmoneyResult),true];
cutText [format["You received %1 coins!",PVDZE_claimmoneyResult], "PLAIN DOWN"];

PVDZE_claimmoney = nil;
PVDZE_claimmoneyResult = nil;
sleep 2;

lastclaim = time;