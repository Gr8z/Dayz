if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_10") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

private ["_dialog"];
_dialog = createdialog "BankDialog";
call BankDialogUpdateAmounts;
player setVariable ["tradingmoney", true, true];

DZE_ActionInProgress = false;

uiSleep 3;