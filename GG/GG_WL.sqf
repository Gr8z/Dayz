#include "shortcuts.h"
_unit = _this select 0;
if (!local _unit) exitWith {};
if (!isDedicated) then {
	waitUntil {!isNil "dayz_animalCheck"}; 
	titleCut ["", "BLACK FADED", 10];
	sleep 1;
	_text = format["<t size='1.5' color='#a81e13'>VIP SLOT</t><br/><t size='1' color='#FFFFFF'>You have joined a VIP slot, please wait in the lobby for a regular slot or donate.</t>",""];
	[_text,0,(safezoneY + 0.8),6,1,0,1] swx AH_fnc_dynamictext;
	sleep 3;
	(findDisplay 49) closeDisplay 0;
	PVDZE_plr_Save = [player,(magazines player),true,true];
	publicVariableServer "PVDZE_plr_Save";
	player xsv ["combattimeout",0,true];
	disableUserInput true;

	sleep 1;
	endMission 'loser';
};
