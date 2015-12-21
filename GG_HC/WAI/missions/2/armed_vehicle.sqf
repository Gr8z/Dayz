private ["_complete","_crate","_mission","_static_gun","_crate_type","_rndnum","_playerPresent","_vehname","_vehicle","_position","_vehclass"];
_vehclass = armed_vehicle call BIS_fnc_selectRandom;
_vehname = getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

_position = [30] call find_position2;
_mission = [_position,"Medium",format["Disabled %1",_vehname],"MainHero",true] call mission_init2;

diag_log format["WAI: [Mission:[Hero] Armed Vehicle]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_small call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];

//Troops
_rndnum = (2 + round (random 4));
[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],2,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Medium","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;

//Static Guns
_static_gun = ai_static_weapons call BIS_fnc_selectRandom;
[[
	[(_position select 0),(_position select 1) + 10, 0]
],_static_gun,"Medium","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static2;

//Spawn Vehicle
_vehicle		= [_vehclass,_position] call custom_publish;

if (debug_mode) then {
	diag_log format["WAI: [Hero] armed_vehicle spawned a %1",_vehname];
};

//Condition
_complete = [
	[_mission,_crate],	// mission number and crate
	["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
	[_vehicle], 		// cleanup objects
	"Bandits have disabled an armed vehicle with some vehicle ammo nearby! Check your map for the location!",	// mission announcement
	"The armed vehicle has been secured, great job!",																		// mission success
	"The armed vehicle has not been secured in time!"																// mission fail
] call mission_winorfail2;

if (_complete) then {[_crate,2,2,[12,crate_items_chainbullets],2] call dynamic_crate};
diag_log format["WAI: [Bandit] armed_vehicle ended at %1",_position];
h_missionrunning2 = false;