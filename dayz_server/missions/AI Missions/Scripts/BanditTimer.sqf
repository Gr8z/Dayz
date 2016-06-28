private["_run","_timeDiff","_timeVar","_wait","_cntMis","_ranMis","_varName"];

_timeDiff = BanditMax - BanditMin;
_timeVar = _timeDiff + BanditMin;

diag_log text format ["[AI Missions]: Bandit Mission Clock Starting!"];

_run = true;
while {_run} do
{
	_wait  = round(random _timeVar);
    [_wait,5] call AIMissionSleep;
	
	_cntMis = count BanditArray;
	if (_cntMis == 0) then { _run = false; };
	
	_ranMis = floor (random _cntMis);
	_varName = BanditArray select _ranMis;
    
    {if (alive _x) then {_x call AIMissionPurge;};} forEach BanditUnits;
    
    BanditUnits = [];
    
	[] execVM format ["\z\addons\dayz_server\missions\AI Missions\Bandit\%1.sqf",_varName];
	diag_log text format ["[AI Missions]: Running Bandit Mission %1.",_varName];
	
	waitUntil {BanditDone};
	BanditDone = false;
};