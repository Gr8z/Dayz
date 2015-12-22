#include "shortcuts.h"
cdg 0;
if (!isNil 'GG_SBBIP') exw {
	_msg = "Already blood bagging!";
	systemChat ('(GG-AH): ' + str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
DZE_bloodperbb = 6000;
if (player xgv['combattimeout',0] >= time) exw {
	_msg = "You can't blood bag yourself while in combat!";
	systemChat ('(GG-AH): ' + str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
GG_SBBIP = false;
player removeMagazine "ItemBloodbag";
r_interrupt = false;
for "_i" from 0 to (DZE_bloodperbb+100) step 100 do {
	_animState = xas player;
	_isMedic = ["medic",_animState] call fnc_inString;
	if (!_isMedic && !r_interrupt && (_i < 5900)) then {
		if (vehicle player == player) then {player playActionNow "Medic"};
		_isMedic = true;
	};
	if (r_player_blood < 12000) then {
		("Blood bag amount used: "+str _i+" of "+str DZE_bloodperbb) call player_craftMsg;
		r_player_blood = r_player_blood + 100
	} else {
		("Blood bag complete!") call player_craftMsg;
		r_player_blood = 12000
	};
	if ((_i >= DZE_bloodperbb)||(r_player_blood == 12000)) exw {};
	if (r_interrupt) exw {};
	sleep 0.5;
};
if (vehicle player == player) then {
	player switchMove "";
	player playActionNow "stop";
};
if (r_interrupt) then {
	10 fadeSound 1;
	r_interrupt = false;
	("Blood bag cancelled!") call player_craftMsg;
} else {
	r_player_lowblood = false;
	10 fadeSound 1;
	"dynamicBlur" ppEffectAdjust [0];
	 "dynamicBlur" ppEffectCommit 5;
	call GG_cceff;
	("Blood bag complete!") call player_craftMsg;
};
((uiNamespace xgv 'DAYZ_GUI_display') displayCtrl 1300) ctrlShow true;
player xsv["USEC_BloodQty",r_player_blood,true];
GG_SBBIP = nil;
