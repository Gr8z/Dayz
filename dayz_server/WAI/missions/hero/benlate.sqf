
// Made by ALLEN from Stacy's Mom
//check out my server, IP: 192.31.185.204:23136

if(isServer) then {

	private			["_room","_complete","_mayor_himself","_crate_type","_mission","_position","_crate","_baserunover","_mayor"];

	_position		= [40] call find_position;
	_mission		= [_position,"hard","Kill Bin Laden","MainHero",true] call mission_init;
	
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

	
	//Static mounted guns
	[[
		[(_position select 0) - 15, (_position select 1) + 15, 0],
		[(_position select 0) + 15, (_position select 1) - 15, 0]
	],"M2StaticMG","Easy","TK_INS_Bonesetter_EP1","Bandit",1,2,"Random","Random",_mission] call spawn_static;

	_complete = [
		[_mission,_crate],		
		["crate"], 
		[_baserunover], 		
		"Rumour says Bin Laden is back. We have to finish him, for good",	// mission announcement
		"Turns out it wasn't Bin Laden; just a group of Middle East bandits",						// mission success
		"Looks like Bin Laden escaped once again... sigh."										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,16,4,2,4] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Kill Bin Laden]: Ended at %1",_position];

	h_missionrunning = false;
};
