private ["_newWealth","_missing","_missingQty","_proceed","_itemIn","_countIn","_target","_objectClasses","_range","_objects","_requirements","_count","_cost","_option"];
disableSerialization;

_range = DZE_PlotPole select 0;
_count = count(nearestObjects [cursorTarget,DZE_maintainClasses,_range]);

_colour = "#ffffff";
if (getPlayerUID player in BuildDonor) then { DZE_BuildingLimit = 10;} else {DZE_BuildingLimit = 150; };
if(_count / DZE_BuildingLimit * 100 < 40)then{
_colour = "#00ff00"; 
};
if(_count / DZE_BuildingLimit * 100 > 75)then{
_colour = "#ff0000"; 
};

_ctrl = ((uiNamespace getVariable "PlotManagement") displayCtrl 7014);
_result =  format["<t color='%3'>%1 / %2</t>" , _count, DZE_BuildingLimit,_colour];
_ctrl ctrlSetStructuredText parseText _result;	
