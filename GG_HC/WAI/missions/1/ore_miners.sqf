private ["_complete","_crate_type","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items","_baserunover","_baserunover0","_baserunover1","_baserunover2","_baserunover3"];
_position = [30] call find_position;
_mission = [_position,"Easy","Ore Miners","MainHero",true] call mission_init;
diag_log format["WAI: [Mission:[Hero] Ore miners]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_small call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

PVOZ_GGHCaddtomonitor = [_crate];publicVariableServer "PVOZ_GGHCaddtomonitor";
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

//Create the Veins
_baserunover0 = createVehicle ["Silver_Vein_DZE",[(_position select 0) - 15, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["Iron_Vein_DZE",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Silver_Vein_DZE",[(_position select 0), (_position select 1) - 15,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["Iron_Vein_DZE",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];

_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3];

{_x setVectorUp surfaceNormal position _x; } count _baserunover;

//Troops
_rndnum = 3 + round(random 3);
[[_position select 0,_position select 1,0],_rndnum,"Medium","Random",3,"Random","INS_Villager4","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],2,"Medium","Random",3,"Random","TK_CIV_Worker02_EP1","Random","Bandit",_mission] call spawn_group;
[[_position select 0,_position select 1,0],3,"Random","Random",3,"Random","TK_CIV_Worker02_EP1","Random","Bandit",_mission] call spawn_group;

[[(_position select 0),(_position select 1),0],[0,0,0],400,"Mi17_DZ",5,"Random","Random",4,"Random","Bandit","Random","Bandit",false,_mission] spawn heli_para;

//Condition
_complete = [
	[_mission,_crate],	// mission number and crate
	["crate"],			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
	[_baserunover,_crate],					// cleanup objects
	"A group of armed miners have struck ore heaven, check your maps for their location!",	// mission announcement
	"The miners have been taken out, grab that ore!",										// mission success
	"The miners took all the ore to themselves, mission failed!"							// mission fail
] call mission_winorfail;

if (_complete) then {
	_crate addWeaponCargoGlobal ["ItemToolbox", 1 + ceil(random 2)];
	_crate addWeaponCargoGlobal ["ItemCrowbar", 1 + ceil(random 2)];
	_crate addWeaponCargoGlobal ["ItemEtool", 1 + ceil(random 2)];
	_crate addMagazineCargoGlobal ["ItemSledgeHead", 0 + ceil(random 2)];
	_crate addMagazineCargoGlobal ["FoodnutMix", 2 + ceil(random 2)];
	_crate addMagazineCargoGlobal ["Itemwaterbottle5oz", 1];
	_crate addMagazineCargoGlobal ["ItemSodaRabbit", 2 + ceil(random 2)];
	_crate addMagazineCargoGlobal ["ItemSledgeHandle", 0 + ceil(random 2)];
};

diag_log format["WAI: [Mission:[Hero] Ore Miners]: Ended at %1",_position];

h_missionrunning = false;