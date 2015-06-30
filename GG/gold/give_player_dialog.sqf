if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_10") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
player setvariable ["TrBsy", true];

private ["_dialog"];
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;

DZE_ActionInProgress = false;

uiSleep 3;
player setvariable ["TrBsy", false];