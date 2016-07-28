#include "shortcuts.h"
if ((_this sel 0) == player) then {
	if (!isDedicated) then {
		waitUntil {!isNil "dayz_animalCheck"}; 
		waitUntil {!isNil "SlotDonor"};
		if !(gpd player in SlotDonor) then {
			titleCut ["", "BLACK FADED", 10];
			sleep 1;
			_text = fmt["<t size='1.5' color='#a81e13'>VIP SLOT</t><br/><t size='1' color='#FFFFFF'>You have joined an Admin Slot! Please wait for a Regular Slot!</t>",""];
			[_text,0,(safezoneY + 0.8),6,1,0,1] swx AH_fnc_dynamictext;
			sleep 3;
			(findDisplay 49) closeDisplay 0;
			disableUserInput true;
			sleep 1;
			endMission 'loser';
		} else {
			systemChat "You have joined an Admin Slot! Never join an Admin Slot when a Regular Slot is available!";
		};
	};
};