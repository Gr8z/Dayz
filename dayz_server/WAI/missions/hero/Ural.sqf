if(isServer) then {
    private			["_complete","_baserunover","_crate_type","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro"];
	item_high_value			    = true;
	item_high_value2			= true;
	item_high_value3			= false;
	weapon_high_value			= false;
	weapon_high_value2			= false;
	weapon_high_value3			= true;
	item_high_value_chance		= 50;
	item_high_value_chance2		= 25;
	item_high_value_chance3 	= 10;
	item_high_value_amounts 	= [1];
	item_high_value_amounts2 	= [1];
	item_high_value_amounts3 	= [1];
	weapon_high_value_chance	= 50;
	weapon_high_value_chance2	= 50;
	weapon_high_value_chance3	= 25;
	weapon_high_value_amounts	= [1];
	weapon_high_value_amounts2	= [1];
	weapon_high_value_amounts3	= [1];
	_mission 		= count wai_mission_data -1;
	_position		= [30] call find_position;
	[_mission,_position,"Easy","Ural Attack","MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Ural Attack]: Starting... %1",_position];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];
	_baserunover 	= createVehicle ["UralWreck",[(_position select 0),(_position select 1),0],[],14,"FORM"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;
	_rndnum 	= 2 + round (random 2);
	_rndgro 	= 1 + round (random 2);
	[[_position select 0,_position select 1,0],_rndnum,"Easy",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	};
	_complete = [
		[_mission,_crate],
		["kill"],
		[_baserunover],
		"Bandits have destroyed a Ural with supplies and are securing the cargo! Check your map for the location!",
		"The supplies have been secured by survivors!",
		"Survivors did not secure the supplies in time"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_random2],4,25,2] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] Ural Attack]: Ended at %1",_position];
	h_missionsrunning = h_missionsrunning - 1;
};