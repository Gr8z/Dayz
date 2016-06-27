donator_key = floor(random 999999);publicVariable "donator_key";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\dynamic_vehicle.sqf";
if (dayZ_instance == 1) then {
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\objects_1.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\safezone.sqf";
};
if (dayZ_instance == 2) then {
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\objects_2.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\Mogilevka.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\Dichina.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\cherno_bridge.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\safezone.sqf";
};
if (dayZ_instance == 3) then {call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\objects_3.sqf";};
execVM "\z\addons\dayz_server\system\server_monitor.sqf";