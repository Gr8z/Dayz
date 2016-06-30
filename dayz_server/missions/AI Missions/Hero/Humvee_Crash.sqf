private ["_missName","_coords","_crash","_crate"];

_missName = "[Mission] Humvee Crash";

_coords = call AIMissionFindPos;

[nil,nil,rTitleText,"A Humvee has crashed!\nGo Investigate the Cause of the Wreck!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM HeroMarker;

_crash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];

[_crash] call ProtectObj;

_crate = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[_coords,3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 1;
[_coords,3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 1;

[_coords,"HeroUnits"] call WaitMissionComp;

[nil,nil,rTitleText,"The Humvee has been Secured by Bandits!", "PLAIN",6] call RE;
diag_log text format["[AI Missions]: Hero Humvee Crash Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;