private ["_mission","_baserunover","_position","_crate","_crate_type","_girls","_girls1","_girls2","_girls3","_dirtyowner","_complete","_dirtyowner2"];
_position = [30] call find_position;
_mission = [_position,"ColorPink","Bunny Ranch","MainHero",false] call mission_init;
	
diag_log format	["WAI: Mission Bunny Ranch Started At %1",_position];

//Setup the crate
_crate_type = crates_large call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
 
//Ranch & Girls
_baserunover = createVehicle ["Land_A_Villa_EP1",[(_position select 0), (_position select 1),0],[], 0, "CAN_COLLIDE"];

_girls1 = [[_position select 0, _position select 1, 0],4,"Extreme","Unarmed",0,"Random","RU_Hooker2","Random",["Hero",80],_mission] call spawn_group;
_girls2 = [[_position select 0, _position select 1, 0],1,"Extreme","Unarmed",0,"Random","RU_Hooker3","Random",["Hero",80],_mission] call spawn_group;
_girls3 = [[_position select 0, _position select 1, 0],2,"Extreme","Unarmed",0,"Random","RU_Hooker4","Random",["Hero",80],_mission] call spawn_group;
_girls = [_girls1,_girls2,_girls3];

//Bunny Ranch Owner
_dirtyowner = [[_position select 0, _position select 1, 0],1,"Extreme",["Random","AT"],5,"Random","Ins_Lopotev","Random",["Bandit",500],_mission] call spawn_group;
_dirtyowner2 = [[_position select 0, _position select 1, 0],1,"Extreme",["Random","AT"],5,"Random","Ins_Lopotev","Random",["Bandit",500],_mission] call spawn_group;

[[(_position select 0),(_position select 1),0],[0,0,0],800,"UH60M_EP1_DZE",6,"Hard","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para;

_complete = [
	[_mission,_crate],								// mission number and crate
	["assassinate",_dirtyowner,_dirtyowner2],	// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
	[_baserunover],				// cleanup objects
	"The Owners of the Bunny Ranch have been beating their girls again, go give them a taste of their own medicine!",	// mission announcement
	"The Bunny Ranch is YOURS! The Girls want to show their gratitude... looks like something is approaching from the distance..",											// mission success
	"News reports of several women found beaten to death, you failed to save them!"														// mission fail
] call mission_winorfail;

if (_complete) then {[_crate,3,3,11,2] call dynamic_crate};

diag_log format["WAI: Mission Bunny Ranch Ended At %1",_position];

h_missionrunning = false;