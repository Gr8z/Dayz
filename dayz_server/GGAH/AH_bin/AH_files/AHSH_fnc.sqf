diag_log ("(GG-AntiHack): Script handler loading!");

_AH_scrhndlr = [];
_AH_MAPEDITS = {};
#include "\z\addons\dayz_server\GGAH\AH_bin\AH_files\Scripts\AHCC_fnc.sqf";		//Chat commands
#include "\z\addons\dayz_server\GGAH\AH_bin\AH_files\Scripts\AHEM_fnc.sqf";		//Escape menu edit
#include "\z\addons\dayz_server\GGAH\AH_bin\AH_files\Scripts\AHDS_fnc.sqf";		//Disable sidechat
#include "\z\addons\dayz_server\GGAH\AH_bin\AH_files\Scripts\AHSS_fnc.sqf";		//Spawn select
#include "\z\addons\dayz_server\GGAH\AH_bin\AH_files\Scripts\AHME_fnc.sqf";		//Map edits

diag_log ("(GG-AntiHack): Script handler loaded!");