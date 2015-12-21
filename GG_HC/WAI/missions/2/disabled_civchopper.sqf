private ["_complete","_vehicle","_mission","_vehname","_position","_vehclass","_crate_type","_crate"];
_vehclass 		= civil_chopper call BIS_fnc_selectRandom;
_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");

_position		= [30] call find_position2;
_mission		= [_position,"Medium",format["Disabled %1", _vehname],"MainHero",true] call mission_init2;

diag_log 		format["WAI: [Mission:[Hero] Disabled Civilian Chopper]: Starting... %1",_position];

_crate_type = crates_small call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];

//Troops
[[_position select 0,_position select 1,0],(2 + round(random 3)),"Random","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],(2 + round(random 4)),"Random","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;

//Static Guns
[[
	[(_position select 0) - 30, (_position select 1) + 30, 0]
],"M2StaticMG","easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static2;

//Spawn vehicle
_vehicle		= [_vehclass,_position] call custom_publish;

if (debug_mode) then {
	diag_log format["WAI: [Hero] disabled_civchopper spawned a %1",_vehname];
};

//Condition
_complete = [
	[_mission,_crate],	// mission number and crate
	["crate"], 			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
	[_vehicle], 		// cleanup objects
	"A civilian aircraft has been located, secure it!",	// mission announcement
	"Survivors have secured the civilian aircraft!",															// mission success
	"Survivors did not secure the civilian aircraft in time"													// mission fail
] call mission_winorfail2;

if (_complete) then {
	[_crate,3,3,3,2] call dynamic_crate;
};

diag_log format["WAI: [Mission:[Hero] Disabled Civilian Chopper]: Ended at %1",_position];

h_missionrunning2 = false;