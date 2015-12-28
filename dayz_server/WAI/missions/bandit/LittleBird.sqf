if(isServer) then {
	private			["_complete","_crate_type","_mission","_vehname","_vehicle","_position","_vehclass","_crate","_baserunover","_rndnum"];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Extreme","Little Bird Gunner","MainBandit",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Bandit] LBG]: Starting... %1",_position];
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
	_vehclass 		= "AH6J_EP1_DZ";
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] little_bird spawned a LBG at %1", _position];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle,_baserunover],
		"Heroes have landed their Little Bird Gunner and are attempting to refuel it. Check your map for the location!",
		"Bandits have secured the Little Bird Gunner!",
		"Bandits did not secure the Little Bird Gunner in time."
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],5,25,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] LBG]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};