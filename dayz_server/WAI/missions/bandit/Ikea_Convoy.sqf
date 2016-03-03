if(isServer) then {
	private	["_complete","_dir","_rndnum","_crate_type","_mission","_position","_vehclass3","_vehclass2","_vehicle3","_vehicle2","_playerPresent","_vehicle","_vehclass","_crate"];
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
	_position		= [40] call find_position;
	[_mission,_position,"Hard","Lunch break Convoy","MainBandit",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Bandit] Lunch break Convoy]: Starting... %1",_position];
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	_rndnum = 5 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[
		[(_position select 0) + 25, (_position select 1) + 25, 0],
		[(_position select 0) - 25, (_position select 1) - 25, 0],
		[(_position select 0) + 25, (_position select 1) - 25, 0]
	],"M2StaticMG","Hard","Hero","Hero",1,2,"Random","Random",_mission] call spawn_static;
	_dir 			= floor(round(random 360));
	_vehclass 		= cargo_trucks 		call BIS_fnc_selectRandom;
	_vehclass2 		= refuel_trucks 	call BIS_fnc_selectRandom;
	_vehclass3 		= military_unarmed 	call BIS_fnc_selectRandom;
	_vehicle		= [_vehclass,_position,_mission,false,_dir] call custom_publish;
	_vehicle2		= [_vehclass2,_position,_mission,false,_dir] call custom_publish;
	_vehicle3		= [_vehclass3,_position,_mission,false,_dir] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] ikea_convoy spawned a %1",_vehclass];
		diag_log format["WAI: [Bandit] ikea_convoy spawned a %1",_vehclass3];
		diag_log format["WAI: [Bandit] ikea_convoy spawned a %1",_vehclass2];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle,_vehicle2,_vehicle3],
		"A heavily guarded Ikea convoy is taking a lunch break, heroes are securing the parameter. See if you can make the building supplies yours.",
		"Bandits have successfully ambushed the Ikea convoy and secured the building supplies!",
		"Bandits were unable to surprise the heroes on their lunchbreak"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[1,crate_weapons_buildables],[4,crate_tools_buildable],[25,crate_items_buildables],4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] Lunch break Convoy]: Ended at %1",_position];
	b_missionsrunning = b_missionsrunning - 1;
};