#include "shortcuts.h"
if (isNil "Smoking_Da_Bong") then {Smoking_Da_Bong = false};
if (Smoking_Da_Bong) exw {
	_msg = "Slow down there! You can only smoke every 2 minutes...";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
[] swx {
	Smoking_Da_Bong = true;
	uiSleep 100;
	Smoking_Da_Bong = false
};
cutText ["You take a hit from the hemp...","PLAIN DOWN"];
playSound "Fountain";
uiSleep 3.25;
playSound "nadech2";
playSound "nadech2";
uiSleep 2;
blurred = ppEffectCreate ["colorCorrections", 1555];
 blurred ppEffectEnable true;
blurred ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.1],  [1, 1, 1, 0.0]];
blurred ppEffectCommit 0;
addCamShake [5, 0.5, 25];
blurred = ppEffectCreate ["colorCorrections", 1555];
 blurred ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
blurred ppEffectCommit 60;
[] swx{
	for "_a" from 0 to 60 do {
		addCamShake [5, 5, 5];
		uiSleep 1;
		addCamShake [2, 1, 2];
	};
};
cutText ["You start to feel...","PLAIN DOWN"];
_sfx = "cough";
[player,_sfx,0,false,5] call dayz_zombieSpeak;
_sfx = "cough";
[player,_sfx,0,false,5] call dayz_zombieSpeak;
uiSleep 2;
cutText ["HIGH AS SHIT!","PLAIN DOWN",3];
_sfx = "cough";
[player,_sfx,0,false,5] call dayz_zombieSpeak;
_sfx = "cough";
[player,_sfx,0,false,5] call dayz_zombieSpeak;
[] swx {
	_gold = "#particlesource" createVehicleLocal getPosATL (vehicle player);
	_gold setParticleParams [["\z\addons\dayz_epoch\models\gold_bar.p3d", 1,1,1],"","SpaceObject",1,5,[0, 0, 5],[0,0,1],1, 1.3, 1, 0,[1],[[1,1,1,0],[1,1,1,0],[1,1,1,0]],[0.25],1,1,"","",player];
	_gold setParticleRandom [0, [0, 0, 1], [(random 5), (random 5), 2], 0.25, 1, [0, 0, 0, 0], 0.5, 0.2, 120];
	_gold setParticleCircle [5, [0,0,0]];
	_gold setDropInterval 0.05;
	uiSleep 60;
	deleteVehicle _gold;
};
uiSleep 3;
[] swx {
	_startTime = time;
	for "_i" from 0 to 60 do {
		if ((random 100) > 50) then {
			_sfx = "cough";
			[player,_sfx,0,false,5] call dayz_zombieSpeak;
			if ((random 100) > 80) then {
				_sfx = "cough";
				[player,_sfx,0,false,5] call dayz_zombieSpeak;
				_sfx = "cough";
				[player,_sfx,0,false,5] call dayz_zombieSpeak;
			};
		};
		uiSleep 1;
		if ((time - _startTime) > 58) exw {};
	};
};
[] swx {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 0;
	blazing = ppEffectCreate ["wetDistortion", 2006];
	blazing ppEffectAdjust [1, 0.56, 0.32, 0.256, 0.08, 0.064, 0.264, 0, 0, 0.108, 0.008, 0, 0, 0, 0.177];
	blazing ppEffectEnable true;
	blazing ppEffectCommit 0;
	uiSleep 5;
	blazing = ppEffectCreate ["wetDistortion", 2006];
	blazing ppEffectAdjust [1, 0.56, 0.32, 0.256, 0.08, 0.064, 0.264, 0, 0, 0.108, 0.008, 0, 0, 0, 0.177];
	blazing ppEffectEnable true;
	blazing ppEffectCommit 0;
	pie = 0;
	_startTime = time;
	for "_i" from 0 to 160 do {
		pie = pie + 0.005;
		"dynamicBlur" ppEffectAdjust [0.1 + pie * 6];
		"dynamicBlur" ppEffectCommit 0;
		blazing ppEffectAdjust [1 + (pie/4), 0.56 - (pie/2), 0.32 + (pie/2), 0.256, 0.08, 0.064, 0.264, 0, 0, 0.108 + (pie/2), 0.008, 0, 0, 0, 0.177];
		blazing ppEffectCommit 0;
		uiSleep 0.4;
	};
	for "_i" from 0 to 80 do {
		pie = pie - 0.01;
		"dynamicBlur" ppEffectAdjust [0.1 + pie * 6];
		"dynamicBlur" ppEffectCommit 0;
		blazing ppEffectAdjust [1 + (pie/4), 0.56 - (pie/2), 0.32 + (pie/2), 0.256, 0.08, 0.064, 0.264, 0, 0, 0.108 + (pie/2), 0.008, 0, 0, 0, 0.177];
		blazing ppEffectCommit 0;
		uiSleep 0.15;
	};
	blazing ppEffectEnable false;
	"dynamicBlur" ppEffectEnable false;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 0;
};
