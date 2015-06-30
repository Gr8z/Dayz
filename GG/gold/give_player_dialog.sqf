if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_10") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
player setVariable['TrBsy',1,true];
private ["_dialog"];
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;

DZE_ActionInProgress = false;

uiSleep 3;
player setVariable['TrBsy',0,true];