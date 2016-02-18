if(isServer) then {
	private			["_complete","_crate_type","_mission","_vehicle","_position","_vehclass","_crate","_rndnum","high_value","high_value2","high_value3","high_value_chance","high_value_chance2","high_value_chance3","high_value_amounts","high_value_amounts2","high_value_amounts3","items_high_value","items_high_value2","weapons_high_value"];
	high_value			   		= true;
	high_value2			   		= true;
	high_value3			   		= true;
	item_high_value_chance		= 100;
	item_high_value_chance2		= 75;
	weapon_high_value_chance	= 50;
	high_value_amounts 			= [1,2,3];
	high_value_amounts2 		= [1,2,3];
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
	_position		= [30] call find_position;
	[_mission,_position,"Extreme","Pook Gunship","MainHero",true] call mission_init;
	diag_log 		format["WAI: [Mission:[Hero] Pook Gunner]: Starting... %1",_position];
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1),0],[],0,"CAN_COLLIDE"];
	_rndnum = 3 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],5,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"M2StaticMG","Extreme","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	_vehclass 		= "pook_H13_gunship";
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Hero] pook_gunner spawned a Pook Gunship at %1", _position];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle],
		"Bandits have hijacked a Pook Gunship. Secure it before they use it for terror!",
		"Heroes have secured the Pook!",
		"The heroes failed to secure the pook"
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[10,ai_wep_random2],5,25,4] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Hero] pook_gunner]: Ended at %1",_position];
	b_missionsrunning = b_missionsrunning - 1;
};