if(isServer) then {

	private			["_room","_complete","_mayor_himself","_crate_type","_mission","_position","_crate","_baserunover","_mayor"];

	// Get mission number, important we do this early
	_mission 		= count wai_mission_data -1;
	
	if(worldName == "Tavi") then {
	_positionarray = [[16665.008,6183.1831,0],[17711.684,6312.3447,0],[17442.844,5034.8325,0],[17250.822,8099.0171,0],[16311.108,8404.6221,0],[15163.863,8138.272,0],[15052.753,9689.3564,0],[14536.239,11673.776,0],[13801.271,12299.523,0],[13811.67,13231.576,0],[12806.122,13682.48,0],[12895.81,14307.783,0],[11764.462,14874.194,0],[11811.919,15867.194,0],[11442.7,15899.821,0],[10651.606,17509.633,0],[11023.075,18388.391,0],[9830.6006,19424.344,0],[8483.9893,20021.035,0],[8265.1348,20881.066,0],[12675.704,19121.58,0],[14967.869,18462.926,0],[15138.043,17366.016,0],[15149.924,16094.297,0],[15198.698,14343.011,0],[16053.953,16223.898,0],[16002.803,14037.48,0],[17149.523,12562.753,0],[16590.836,11538.518,0],[16696.766,9795.2422,0],[15750.51,9821.0791,0],[9274.0557,7722.4824,0],[8854.3154,8261.5176,0],[7778.9141,9093.8115,0],[6072.1567,9944.6973,0],[5684.1387,8341.6025,0],[3915.4873,7882.4014,0],[2274.2927,7549.2588,0],[1711.1221,6832.3374,0],[4163.1504,6456.9678,0],[5677.3354,5908.9209,0],[7483.2227,4677.8555,0],[7748.0342,4308.8159,0],[8182.8174,6512.3086,0],[9375.5684,1960.1821,0],[11495.309,466.6373,0],[9930,3216.6116,0],[9541.5059,4502.3677,0],[8941.1084,5177.0493,0],[10099.235,5729.9028,0],[10298.205,6403.6235,0],[8494.6377,7845.4551,0],[7368.8223,7480.6504,0]]; _position = _positionarray call BIS_fnc_selectRandom;
	}else {
	_position		= [30] call find_position;
	};
	
	
	[_mission,_position,"Hard","Kill Bin Laden","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Kill Bin Laden]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	 
	_baserunover4 	= createVehicle ["BMP2_HQ_CDF_unfolded",[(_position select 0) - 30, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["BRDM2_HQ_Gue_unfolded",[(_position select 0) + 30, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["CDF_WarfareBAntiAirRadar",[(_position select 0), (_position select 1) - 30,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["CDF_WarfareBFieldhHospital",[(_position select 0), (_position select 1) + 30,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover4,_baserunover1,_baserunover2,_baserunover3];
	

	//Troops
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","TK_GUE_Soldier_AAT_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","TK_GUE_Soldier_4_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","TK_GUE_Soldier_TL_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","TK_INS_Bonesetter_EP1","Random","Bandit",_mission] call spawn_group;

	
	[[(_position select 0) + 50, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"Pickup_PK_GUE","random","bandit","bandit",_mission] call vehicle_patrol;

	
	//Static guns
	_static_gun = ai_static_weapons call BIS_fnc_selectRandom;
	[[
		[(_position select 0) - 13.135, (_position select 1) + 5.025, 15],
		[(_position select 0) + 14.225, (_position select 1) + 5.025, 15],
		[(_position select 0) + 35, (_position select 1) - 25, 0]
	],_static_gun,"Medium","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;

	_complete = [
		[_mission,_crate],		
		["crate"], 
		[_baserunover], 		
		"Rumour says Bin Laden is back. We have to finish him, for good",	// mission announcement
		"Turns out it wasn't Bin Laden; just a group of Middle East bandits",						// mission success
		"Looks like Bin Laden escaped once again... sigh."										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,[16,crate_weapons_missionbase],4,2,4] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Kill Bin Laden]: Ended at %1",_position];

	h_missionsrunning = h_missionsrunning - 1;
};
