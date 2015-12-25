if(isServer) then {
	private			["_complete","_crate_type","_mission","_vehname","_vehicle","_position","_vehclass","_crate","_baserunover","_rndnum"];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Extreme","Jackal Convoy","MainBandit",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Bandit] Captured Jackal]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];

	_rndnum = 3 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) + 10, (_position select 1) - 10, 0],
		[(_position select 0) - 10, (_position select 1) + 10, 0],
		[(_position select 0) - 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	_vehclass 		= "BAF_Jackal2_L2A1_W";
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] captured_jackal spawned a Jackal at %1", _position];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle,_baserunover],
		"A Hero Jackal convoy has broken down! Are you brave enough to take the jackal before the Heroes use it for peace?!",
		"Bandits have secured the jackal!",
		"Bandits did not secure the jackal in time."
	] call mission_winorfail;
	if(_complete) then {
		[_crate,5,5,25,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] Captured Jackal]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};