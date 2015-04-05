waitUntil {uiSleep .25;(!isNil "PVDZE_plr_LoginRecord")};

_loginGroup = group player;
if (count units _loginGroup > 1) then {[player] join grpNull;deleteGroup _loginGroup;};
{
	if ((!isNull _x) && {(_x getVariable["bodyUID","0"]) == (getPlayerUID player)}) then {
		_bodyGroup = _x getVariable["bodyGroup",grpNull];
		if (({alive _x} count units _bodyGroup) > 0) then {[player] join _bodyGroup;deleteGroup _loginGroup;};
	};
} count allDead;

acceptGroupInvite = compile preprocessFileLineNumbers "GG\group\acceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "GG\group\declineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "GG\group\disbandGroup.sqf";
inviteToGroup = compile preprocessFileLineNumbers "GG\group\inviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "GG\group\kickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "GG\group\leaveGroup.sqf";
mapLoop = compile preprocessFileLineNumbers "GG\group\mapLoop.sqf";
playerSelectChange = compile preprocessFileLineNumbers "GG\group\playerSelectChange.sqf";
updatePlayerList = compile preprocessFileLineNumbers "GG\group\updatePlayerList.sqf";
tagName = true;
	
if (isNil "dzgmInit") then {call compile preprocessFileLineNumbers "GG\group\icons.sqf";};
uiSleep 1;
[] spawn dzgmInit;
[] spawn mapLoop;