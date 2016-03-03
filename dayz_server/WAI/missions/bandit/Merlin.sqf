if(isServer) then {
	private	["_complete","_crate_type","_mission","_vehicle","_position","_vehclass","_crate","_baserunover","_rndnum"];
	item_high_value			    = true;
	item_high_value2			= true;
	item_high_value3			= true;
	weapon_high_value			= true;
	weapon_high_value2			= true;
	weapon_high_value3			= true;
	item_high_value_chance		= 75;
	item_high_value_chance2		= 25;
	item_high_value_chance3 	= 10;
	item_high_value_amounts 	= [1];
	item_high_value_amounts2 	= [1];
	item_high_value_amounts3 	= [1];
	weapon_high_value_chance	= 50;
	weapon_high_value_chance2	= 50;
	weapon_high_value_chance3	= 50;
	weapon_high_value_amounts	= [1];
	weapon_high_value_amounts2	= [1];
	weapon_high_value_amounts3	= [1];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Hard","Merlin Evac","MainBandit",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Bandit] Merlin Evac]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1),0],[],0,"CAN_COLLIDE"];
	_rndnum = 4 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0, _position select 1, 0],4,"Hard","Random",4,"Random","Doctor","Random",["Hero",200],_mission] call spawn_group;
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) + 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	_vehclass 		= "BAF_Merlin_DZE";
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] merlin_evac spawned a Merlin at %1", _position];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle],
		"Heroes have landed a Merlin and are evacuating survivors. Show no mercy and make the Merlin yours!",
		"Bandits have murdered the survivors and stolen to Merlin!",
		"The Survivors were evacuated successfully."
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],5,25,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] Merlin_evac]: Ended at %1",_position];
	b_missionsrunning = b_missionsrunning - 1;
};