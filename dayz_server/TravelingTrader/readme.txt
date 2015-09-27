Epoch Dynamic Traders my maca134
http://www.epochservers.com

Server
======
Copy the "DynamicTraders" folder into the server pbo.

In server_monitor.sqf, at the bottom add:
execVM "\z\addons\dayz_server\DynamicTraders\init.sqf";

You will need to go into each file in the traders file and change the model/skin to the relevent trader for the map you are using. 
Look in server_traders.sqf in the mission pbo for more information.

Mission
=======
Copy player_tradermarkers.sqf from the "DynamicTraders" folder and place it in the mission pbo

Add this into the init.sqf in the mission pbo

execVM "player_tradermarkers.sqf";

Eg:
if (!isDedicated) then {
	...code...
	...code...
	...code...
	execVM "player_tradermarkers.sqf";
};