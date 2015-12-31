private ["_Secondary"];
_Secondary = currentWeapon player;
suicide_answer=nil;
canAbort = true;
DamiSpawn = 
[
	["Suicide Confirmation",true],
	["Are you sure?", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["No", [2], "", -5, 	[["expression", "suicide_answer=false;"]], "1", "1"],
	["Yes", [3], "", -5, 	[["expression", "suicide_answer=true;"]], "1", "1"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, 	[["expression", "suicide_answer=false;"]], "1", "1"]
];
showCommandingMenu "#USER:DamiSpawn";
waitUntil {((!isNil 'suicide_answer')||(commandingMenu == ""))};
if (isNil 'suicide_answer') then {suicide_answer=false;};
if (suicide_answer) then
{
	canAbort = false;
	player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
	sleep 8.4;
	player fire _Secondary;
	_unit = player;
	_selection = "body";
	_damage = 1;
	_unit setHit[_selection,_damage];
} else {
	systemChat ("Suicide canceled.");
};