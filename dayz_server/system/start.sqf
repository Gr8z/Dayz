donator_key = floor(random 999999);publicVariable "donator_key";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\dynamic_vehicle.sqf";
if (dayZ_instance == 1) then {
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\objects_1.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\safezone.sqf";
};
if (dayZ_instance == 2) then {
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\objects_2.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\Mogilevka.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\Dichina.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\cherno_bridge.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\map\safezone.sqf";
};
execVM "\z\addons\dayz_server\system\server_monitor.sqf";