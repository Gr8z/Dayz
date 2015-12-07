diag_log ("(GG-AntiHack): Script handler loading!");

_AH_scrhndlr = [];
_AH_MAPEDITS = {};
#include "\@GGAH\AH_bin\AH_files\Scripts\AHCC_fnc.sqf";		//Chat commands
#include "\@GGAH\AH_bin\AH_files\Scripts\AHEM_fnc.sqf";		//Escape menu edit
#include "\@GGAH\AH_bin\AH_files\Scripts\AHME_fnc.sqf";		//Escape menu edit
#include "\@GGAH\AH_bin\AH_files\Scripts\AHDS_fnc.sqf";		//Disable sidechat
#include "\@GGAH\AH_bin\AH_files\Scripts\AHSS_fnc.sqf";		//Spawn select

diag_log ("(GG-AntiHack): Script handler loaded!");