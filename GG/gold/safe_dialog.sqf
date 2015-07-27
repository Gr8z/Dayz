if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_10") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

private ["_dialog"];
ZSC_CurrentStorage = _this select 3;
_dialog = createdialog "SafeDialog";
call SafeDialogUpdateAmounts;
player setVariable ["tradingmoney", true, true];

DZE_ActionInProgress = false;

waitUntil {uiSleep 1; !dialog};
player setVariable ["tradingmoney", false, true];