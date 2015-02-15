if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items"];

	_position		= [30] call find_position;
	_mission		= [_position,"Medium","Troop Supply","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Troop Supply]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	
	_baserunover1 	= createVehicle ["CDF_WarfareBArtilleryRadar",[(_position select 0) +15, (_position select 1) -20,0],[], 0, "CAN_COLLIDE"];
	_baserunover 	= [_baserunover1];
		{ _x setVectorUp surfaceNormal position  _x; } count _baserunover;

	//Troops
	[[(_position select 0) + 5,_position select 1,0],3,"Medium","Random",4,"Random","Pierce","Random","Hero",_mission] call spawn_group;
	[[(_position select 0) + 5,_position select 1,0],3,"Medium","Random",4,"Random","US_Delta_Force_Assault_EP1","Random","Hero",_mission] call spawn_group;
	[[(_position select 0) + 5,_position select 1,0],3,"Medium","Random",4,"Random","MVD_Soldier_GL","Random","Hero",_mission] call spawn_group;
	[[(_position select 0) + 5,_position select 1,0],1,"Medium","Random",4,"Random","RUS_Commander","Random","Hero",_mission] call spawn_group;
	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",3,"Random","Hero","Random","Hero",_mission] call spawn_group;
	};

	//Static Guns
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) + 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Easy","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[], 				// cleanup objects
		"The local troops have obtained a weapons crate. Check your map for the location!",	// mission announcement
		"Bandits have secured the supplies!",									// mission success
		"Bandits did not secure the supplies in time"							// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,10,4,0,2] call dynamic_crate;
	};

	diag_log format["WAI: [Bandit] troop_supply ended at %1",_position];
	
	b_missionrunning = false;
};