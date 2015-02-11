private ["_plotpole", "_owner"];
CurrentPlotpole = (_this select 3) select 0;
_owner = (_this select 3) select 1;
createdialog "PlotPoleManager";
if (0 > 2) then { //_owner != getPlayerUID player
	ctrlEnable [4503, false];
	ctrlEnable [4504, false];
};
call PlotPoleLoadLists;
call PlotPoleMaintainInfo;