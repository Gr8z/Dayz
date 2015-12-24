donator_key = floor(random 999999);publicVariable "donator_key";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\missions\dynamic_vehicle.sqf";
execVM "\z\addons\dayz_server\system\server_monitor.sqf";