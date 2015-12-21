donator_key = floor(random 999999);publicVariable "donator_key";
call compile preProcessFileLineNumbers (if (dayz_instance == 3) then [{"\z\addons\dayz_server\missions\DayZ_overpoch.chernarus\dynamic_vehicle.sqf"},{"\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf"}]);
execVM "\z\addons\dayz_server\system\server_monitor.sqf";