private ["_dialog"];
player setVariable["TrBsy",true,0];
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;
waitUntil { !dialog };
uiSleep 3;
player setVariable ["TrBsy",false,0];