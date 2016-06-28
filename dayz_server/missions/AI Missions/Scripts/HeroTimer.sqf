private["_run","_timeDiff","_timeVar","_wait","_cntMis","_ranMis","_varName"];

_timeDiff = HeroMax - HeroMin;
_timeVar = _timeDiff + HeroMin;

diag_log text format ["[AI Missions]: Hero Mission Clock Starting!"];

_run = true;
while {_run} do
{
	_wait  = round(random _timeVar);
    [_wait,5] call AIMissionSleep;
	
	_cntMis = count HeroArray;
	if (_cntMis == 0) then { _run = false; };
	
	_ranMis = floor (random _cntMis);
	_varName = HeroArray select _ranMis;
    
    {if (alive _x) then {_x call AIMissionPurge;};} forEach HeroUnits;
    
    HeroUnits = [];
    
	[] execVM format ["\z\addons\dayz_server\missions\AI Missions\Hero\%1.sqf",_varName];
	diag_log text format ["[AI Missions]: Running Hero Mission %1.",_varName];
	
	waitUntil {HeroDone};
	HeroDone = false;
};