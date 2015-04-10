private ["_dialog"];
player setVariable["TrBsy",true,0];
_dialog = createdialog "BankDialog";
call BankDialogUpdateAmounts;
waitUntil { !dialog };
uiSleep 3;
player setVariable ["TrBsy",false,0];