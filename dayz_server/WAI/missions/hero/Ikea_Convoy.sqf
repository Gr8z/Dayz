if(isServer) then {
	private			["_complete","_dir","_rndnum","_crate_type","_mission","_position","_vehclass3","_vehclass2","_vehicle3","_vehicle2","_playerPresent","_vehicle","_vehclass","_crate","high_value","high_value2","high_value3","high_value_chance","high_value_chance2","high_value_chance3","high_value_amounts","high_value_amounts2","high_value_amounts3","items_high_value","items_high_value2","weapons_high_value"];
	high_value			   		= true;
	high_value2			   		= true;
	high_value3			   		= true;
	item_high_value_chance		= 90;
	item_high_value_chance2		= 60;
	weapon_high_value_chance	= 35;
	high_value_amounts 			= [1,2];
	high_value_amounts2 		= [1];
	high_value_amounts3 		= [1];
	items_high_value = [
	"ItemBriefcase100oz"
	];
	items_high_value2 = [
	"ItemVault"
	];
	weapons_high_value = [
	"ItemHotwireKit",
	"RPG18",
	"Stinger",
	"Javelin"
	];
	_mission 		= count wai_mission_data -1;
	_position		= [40] call find_position;
	[_mission,_position,"Hard","Disabled Convoy","MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Disabled Convoy]: Starting... %1",_position];
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	_rndnum = 5 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[
		[(_position select 0) + 25, (_position select 1) + 25, 0],
		[(_position select 0) - 25, (_position select 1) - 25, 0],
		[(_position select 0) + 25, (_position select 1) - 25, 0]
	],"M2StaticMG","Hard","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static;
	_dir 			= floor(round(random 360));
	_vehclass 		= cargo_trucks 		call BIS_fnc_selectRandom;		// Cargo Truck
	_vehclass2 		= refuel_trucks 	call BIS_fnc_selectRandom;		// Refuel Truck
	_vehclass3 		= military_unarmed 	call BIS_fnc_selectRandom;		// Military Unarmed
	_vehicle		= [_vehclass,_position,_mission,false,_dir] 	call custom_publish;
	_vehicle2		= [_vehclass2,_position,_mission,false,_dir] call custom_publish;
	_vehicle3		= [_vehclass3,_position,_mission,false,_dir] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass];
		diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass3];
		diag_log format["WAI: [Hero] ikea_convoy spawned a %1",_vehclass2];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle,_vehicle2,_vehicle3],
		"An Ikea delivery has been hijacked by bandits, take over the convoy and the building supplies are yours!",
		"Survivors have secured the building supplies!",
		"Survivors did not secure the convoy in time"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[1,crate_weapons_buildables],[4,crate_tools_buildable],[25,crate_items_buildables],4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] Disabled Convoy]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};