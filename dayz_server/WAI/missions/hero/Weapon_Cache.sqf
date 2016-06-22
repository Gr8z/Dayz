if(isServer) then {
	private 		["_complete","_crate_type","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items"];
	item_high_value			    = true;
	item_high_value2			= true;
	item_high_value3			= true;
	weapon_high_value			= true;
	weapon_high_value2			= true;
	weapon_high_value3			= true;
	item_high_value_chance		= 75;
	item_high_value_chance2		= 15;
	item_high_value_chance3 	= 5;
	item_high_value_amounts 	= [1];
	item_high_value_amounts2 	= [1];
	item_high_value_amounts3 	= [1];
	weapon_high_value_chance	= 10;
	weapon_high_value_chance2	= 8;
	weapon_high_value_chance3	= 45;
	weapon_high_value_amounts	= [1];
	weapon_high_value_amounts2	= [1];
	weapon_high_value_amounts3	= [1];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Medium","Weapon Cache","MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Weapon Cache]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	_rndnum 	= (3 + round(random 3));
	_rndgro 	= (1 + round(random 2));
	[[_position select 0,_position select 1,0],_rndnum,"Easy",["Random","AT"],3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	};
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) - 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	_complete = [
		[_mission,_crate],
		["crate"],
		[],
		"Bandits have obtained a weapon crate. Check your map for the location!",
		"Survivors have secured the weapon cache!",
		"Survivors did not secure the weapon cache in time"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],10,20,2] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] Weapon Cache]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};