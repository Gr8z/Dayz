if(isServer) then {
	private			["_complete","_crate_type","_mission","_vehicle","_position","_vehclass","_crate","_baserunover","_rndnum"];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Extreme","Pook Gunship","MainBandit",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Bandit] Pook Gunner]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1),0],[],0,"CAN_COLLIDE"];
	_rndnum = 4 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Extreme",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0, _position select 1, 0],4,"Extreme","Random",4,"Random","Doctor","Random",["Hero",200],_mission] call spawn_group;
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"M2StaticMG","Extreme","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	_vehclass 		= "pook_H13_gunship";
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] pook_gunner spawned a Pook Gunship at %1", _position];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle],
		"Heros are guarding their Pook Gunship. Steal it and dominate the skies!",
		"Bandits have stolen the Pook Gunship!",
		"Bandits failed to secure the Pook Gunship."
	] call mission_winorfail;
	if(_complete) then {
		[_crate,5,5,25,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] pook_gunner]: Ended at %1",_position];
	b_missionsrunning = b_missionsrunning - 1;
};