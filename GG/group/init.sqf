#include "Epoch\shortcuts.h"
private ["_loginGroup","_loginVar"];

_loginVar = if (isClass(xcf >> "CfgWeapons" >> "Chainsaw")) then {"PVDZE_plr_LoginRecord"} else {"PVDZ_plr_LoginRecord"};
waitUntil {uiSleep .25;(!isNil _loginVar)};
if (count units group player > 1) then {[player] join grpNull;};

_savedGroup = pns xgv["savedGroup",[]];
player xsv ["savedGroup",_savedGroup,true];
player xsv ["purgeGroup",0,true];
if (count _savedGroup > 1) then {
	{
		if (((gpd _x) in _savedGroup) && {(gpd player) in (_x xgv["savedGroup",[]])} && {_x != player}) exw {
			_loginGroup = group player;
			[player] join (group _x);
			if (count units _loginGroup < 1) then {deleteGroup _loginGroup;};
		};
	} count playableUnits;
};

acceptGroupInvite = xcm xlx "GG\group\acceptGroupInvite.sqf";
declineGroupInvite = xcm xlx "GG\group\declineGroupInvite.sqf";
disbandGroup = xcm xlx "GG\group\disbandGroup.sqf";
dzgmSlowLoop = xcm xlx "GG\group\slowLoop.sqf";
inviteToGroup = xcm xlx "GG\group\inviteToGroup.sqf";
kickFromGroup = xcm xlx "GG\group\kickFromGroup.sqf";
leaveGroup = xcm xlx "GG\group\leaveGroup.sqf";
playerSelectChange = xcm xlx "GG\group\playerSelectChange.sqf";
tagName = true;
updatePlayerList = xcm xlx "GG\group\updatePlayerList.sqf";
	
if (isNil "dzgmInit") then {call xcm xlx "GG\group\icons.sqf";};
uiSleep 1;
[] swx dzgmInit;
[] swx dzgmSlowLoop;