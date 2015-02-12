// Made by ALLEN from Stacy's Mom
//check out my server, IP: 192.31.185.204:23136



if(isServer) then {

	private			["_complete","_president_himself","_crate_type","_mission","_position","_crate","_rndnum","_baserunover","_president","_firstlady"];

	_position		= [50] call find_position;
	_mission		= [_position,"hard","Kill Bin Laden","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] real_benlate]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),.1], [], 0, "CAN_COLLIDE"];
	
	//Hotel
	_baserunover 	= createVehicle ["Land_A_BuildingWIP",[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","TK_GUE_Soldier_AAT_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","TK_GUE_Soldier_AT_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","TK_INS_Soldier_2_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","TK_Special_Forces_EP1","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Extreme","Random",4,"Random","TK_INS_Soldier_TL_EP1","Random","Bandit",_mission] call spawn_group;

	
	//The President Himself
	_president = [[((_position select 0) + 5), _position select 1, 4.1],1,"Extreme","Random",4,"none","TK_Aziz_EP1","Random",["Bandit",750],_mission] call spawn_group;
	_firstlady = [[((_position select 0) + 7), _position select 1, 4.1],1,"Extreme","Random",4,"none","TK_CIV_Woman01_EP1","Random",["Bandit",250],_mission] call spawn_group;

	_president_himself = (units _president) select 0;
	_president_himself disableAI "MOVE";

	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"Pickup_PK_GUE","Random","TK_Soldier_Crew_EP1","Bandit",_mission] call vehicle_patrol;

	//Heli Paradrop
	[[(_position select 0),(_position select 1),0],[0,0,0],800,"UH60M_EP1_DZE",5,"Random","Random",4,"Random","TK_Soldier_Night_2_EP1","Random","Bandit",false,_mission] spawn heli_para;
	[[(_position select 0) + 50,(_position select 1),0],[50,50,0],800,"UH60M_EP1_DZE",5,"Random","Random",4,"Random","TK_Soldier_HAT_EP1","Random","Bandit",false,_mission] spawn heli_para;
	
	//Static guns
	[[
		[(_position select 0) - 13.135, (_position select 1) + 5.025, 15],
		[(_position select 0) + 14.225, (_position select 1) + 5.025, 15],
		[(_position select 0) + 35, (_position select 1) - 25, 0]
	],"M2StaticMG","Extreme","TK_INS_Warlord_EP1","Bandit",1,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],			
		["assassinate",_president], 
		[_baserunover], 			
		"Rumour says Bin Laden is back. We have to finish him, for good",	// mission announcement
		"Thank God, Bin Laden has been executed",							// mission success
		"Looks like Bin Laden escaped once again... sigh"										// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,15,5,[15,crate_items_president],2] call dynamic_crate;
	};

	diag_log format["WAI: [Hero] real_benlate ended at %1",_position];

	h_missionrunning = false;
};
