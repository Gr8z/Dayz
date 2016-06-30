private ["_missName","_coords","_crash","_crate","_crate1","_crate2"];

_missName = "[Mission] Weapons Truck";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"A Weapons Truck has Crashed!\nGo Recover the Supplies!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM BanditMarker;

_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

[_crash] call ProtectObj;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"WeaponsBox"] ExecVM BoxSetup;
[_crate1] call ProtectObj;

_crate2 = createVehicle ["RULaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"WeaponsBox"] ExecVM BoxSetup;
[_crate2] call ProtectObj;

[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;

[_coords,"BanditUnits"] call WaitMissionComp;

[nil,nil,rTitleText,"The Weapons Truck has been Secured by Heroes!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Bandit Weapons Truck Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;