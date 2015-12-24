private ["_complete","_dir","_rndnum","_crate_type","_mission","_position","_vehclass3","_vehicle3","_playerPresent","_vehicle","_vehclass","_crate"];

_position = [40] call find_position2;
_mission = [_position,"Hard","Disabled Convoy","MainHero",true] call mission_init2;

diag_log format["WAI: [Mission:[Hero] Disabled Convoy]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_large call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];

//Troops
_rndnum = 3 + round (random 2);
[[_position select 0,_position select 1,0],(2 + round(random 3)),"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;


//Static Guns
[[
	[(_position select 0) + 25, (_position select 1) + 25, 0],
	[(_position select 0) - 25, (_position select 1) - 25, 0]
],"M2StaticMG","Medium","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static2;

//Heli Para Drop
[[(_position select 0),(_position select 1),0],[0,0,0],400,"BAF_Merlin_HC3_D",5,"Random","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para2;

// Spawn Vehicles
_dir = ceil(round(random 360));

_vehclass = cargo_trucks 		call BIS_fnc_selectRandom;		// Cargo Truck
_vehclass3 = military_unarmed 	call BIS_fnc_selectRandom;		// Military Unarmed

_vehicle = [_vehclass,_position,false,_dir] 	call custom_publish;
_vehicle3 = [_vehclass3,_position,false,_dir] call custom_publish;

if (debug_mode) then {
	diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass];
	diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass3];
};

//Condition
_complete = [
	[_mission,_crate],				// mission number and crate
	["crate"],		// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
	[_vehicle,_vehicle3],	// cleanup objects
	"Bandits have disabled a Convoy, check your map for the location!",	// mission announcement
	"Bandits have successfully ambushed the Ikea convoy and secured the supplies!",			// mission success
	"The convoy has not been captured in time!"									// mission fail
] call mission_winorfail2;

if (_complete) then {
	[_crate] call spawn_ammo_box;
};

diag_log format["WAI: [Mission:[Hero] Disabled Convoy]: Ended at %1",_position];

h_missionrunning2 = false;