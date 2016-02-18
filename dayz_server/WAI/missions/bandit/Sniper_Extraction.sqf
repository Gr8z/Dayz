if(isServer) then {
	private ["_complete","_vehicle","_rndnum","_crate_type","_crate","_mission","_tanktraps","_mines","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition","high_value","high_value2","high_value3","high_value_chance","high_value_chance2","high_value_chance3","high_value_amounts","high_value_amounts2","high_value_amounts3","items_high_value","items_high_value2","weapons_high_value"];
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
	_vehclass 		= armed_chopper call BIS_fnc_selectRandom;
	_vehname 		= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");
	_position		= [30] call find_position;
	[_mission,_position,"Hard",format["Sniper Extraction %1", _vehname],"MainBandit",true] call mission_init;	
	diag_log 		format["WAI: [Mission:[Bandit] Sniper Extraction]: Starting... %1",_position];
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
	_rndnum = 2 + round (random 4);
	[[_position select 0,_position select 1,0],_rndnum,"Hard",["Random","AT"],4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[
		[(_position select 0) + 30, (_position select 1) - 30, 0],
		[(_position select 0) + 30, (_position select 1) + 30, 0],
		[(_position select 0) - 30, (_position select 1) - 30, 0],
		[(_position select 0) - 30, (_position select 1) + 30, 0]
	],"M2StaticMG","Hard","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	_vehicle		= [_vehclass,_position,_mission] call custom_publish;
	if(debug_mode) then {
		diag_log format["WAI: [Bandit] sniper_extraction spawned a %1",_vehname];
	};
	_complete = [
		[_mission,_crate],
		["crate"],
		[_vehicle],
		"Heroes have captured a lot of sniper rifles from the Takistani bandit clan, make your move as a bandit whilst they are planning a getaway",
		"Bandits have secured the snipers and taken the chopper!",
		"Bandits did not secure the sniper rifles in time"
	] call mission_winorfail;
	if(_complete) then {
		[_crate,[10,ai_wep_sniper],[4,crate_tools_sniper],[4,crate_items_sniper],2] call dynamic_crate;
	};
	diag_log format["WAI: [Mission:[Bandit] Sniper Extraction]: Ended at %1",_position];
	b_missionsrunning = b_missionsrunning - 1;
};