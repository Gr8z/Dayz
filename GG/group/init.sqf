private ["_loginGroup","_loginVar"];

_loginVar = if (isClass(configFile >> "CfgWeapons" >> "Chainsaw")) then {"PVDZE_plr_LoginRecord"} else {"PVDZ_plr_LoginRecord"};
waitUntil {uiSleep .25;(!isNil _loginVar)};
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
systemChat "Server: Press Right-Shift to open the Group Management Panel";
sleep 10;
systemChat "Server: Press Right-Alt to open the Action Menu";
sleep 10;
systemChat "Server: Type !help to view a list of chat commands";
sleep 10;
systemChat "Server: Press Y to Toggle Ear Plugs";
sleep 10;
systemChat "Server: Be sure to type !rules to get a decent understanding of the server rules!";