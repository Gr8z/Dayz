private ["_loginGroup","_loginVar"];
waitUntil {uiSleep .25;(!isNil "PVDZE_plr_LoginRecord")};
if (count units group player > 1) then {[player] join grpNull;};

_savedGroup = profileNamespace getVariable["savedGroup",[]];
player setVariable ["savedGroup",_savedGroup,true];
player setVariable ["purgeGroup",0,true];
if (count _savedGroup > 1) then {
	{
		if (((getPlayerUID _x) in _savedGroup) && {(getPlayerUID player) in (_x getVariable["savedGroup",[]])} && {_x != player}) exitWith {
			_loginGroup = group player;
			[player] join (group _x);
			if (count units _loginGroup < 1) then {deleteGroup _loginGroup;};
		};
	} count playableUnits;
};


acceptGroupInvite = compile preprocessFileLineNumbers "GG\group\acceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "GG\group\declineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "GG\group\disbandGroup.sqf";
dzgmSlowLoop = compile preprocessFileLineNumbers "GG\group\slowLoop.sqf";
inviteToGroup = compile preprocessFileLineNumbers "GG\group\inviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "GG\group\kickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "GG\group\leaveGroup.sqf";
playerSelectChange = compile preprocessFileLineNumbers "GG\group\playerSelectChange.sqf";
tagName = true;
updatePlayerList = compile preprocessFileLineNumbers "GG\group\updatePlayerList.sqf";
	
if (isNil "dzgmInit") then {call compile preprocessFileLineNumbers "GG\group\icons.sqf";};
uiSleep 1;
[] spawn dzgmInit;
[] spawn dzgmSlowLoop;