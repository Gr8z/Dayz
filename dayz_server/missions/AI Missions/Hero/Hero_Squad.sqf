private ["_missName","_coords","_vehicle","_txt"];

_missName = "[Mission] Hero Squad";

_coords = call AIMissionFindPos;

_txt = "A Hero Squad has been spotted! Stop them from completing their patrol!";
fnc_show_colorAdminMsg = [_txt,'#0049FF'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM HeroMarker;

[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 5;
[_coords,2,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 1;

[_coords,"HeroUnits"] call WaitMissionComp;

_txt = "The Hero Squad has been Wiped Out!";
fnc_show_colorAdminMsg = [_txt,'#0049FF'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Hero Squad Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;