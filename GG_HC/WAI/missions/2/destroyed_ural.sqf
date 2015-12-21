private ["_complete","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro","_crate_type","_baserunover"];

_position = [30] call find_position2;
_mission = [_position,"Easy","Ural Attack","MainHero",true] call mission_init2;

diag_log format["WAI: [Mission:[Hero] Ural Attack]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_medium call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];

//Base
_baserunover = createVehicle ["UralWreck",[(_position select 0),(_position select 1),0],[],14,"FORM"];
_baserunover setVectorUp surfaceNormal position _baserunover;

//Troops
[[_position select 0,_position select 1,0],(2 + round(random 4)),"Easy","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Easy","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Easy","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;

//Condition
_complete = [
	[_mission,_crate],		// mission number and crate
	["crate"],// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
	[_baserunover], 		// cleanup objects
	"Bandits have destroyed a Ural with supplies and are securing the cargo! Check your map for the location!",	// mission announcement
	"The exploded Ural has been secured, great job!",															// mission success
	"The Ural and its supplies were not secured in time!"														// mission fail
] call mission_winorfail2;

if (_complete) then {[_crate] call spawn_ammo_box};
diag_log format["WAI: [Mission:[Hero] Ural Attack]: Ended at %1",_position];
h_missionrunning2 = false;