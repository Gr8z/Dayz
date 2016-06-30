private ["_missName","_coords","_crash","_crate"];

_missName = "[Mission] Helicopter Crash";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"A Helicopter has Crashed!\nGo Check for Survivors!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM BanditMarker;

_crash = createVehicle ["UH60Wreck_DZ", _coords,[], 0, "CAN_COLLIDE"];

[_crash] call ProtectObj;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[_coords,3,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;

[_coords,"BanditUnits"] call WaitMissionComp;

[nil,nil,rTitleText,"The Helicopter Crash has been Secured by Heroes!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Bandit Crash Site Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;