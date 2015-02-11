private ["_groupExists","_inviterUID","_inviter"];

_groupExists = false;
{
	if (getPlayerUID player == _x select 1) then {
    	_inviterUID = _x select 0;
        currentInvites set [_forEachIndex,"REMOVETHISCRAP"];
        currentInvites = currentInvites - ["REMOVETHISCRAP"];
        publicVariableServer "currentInvites";
	};
} forEach currentInvites;

{
	if ((!isNull _x) && {getPlayerUID _x == _inviterUID}) exitWith {
		_inviter = _x;
		_groupExists = true;
	};
} count playableUnits;

if (_groupExists) then {
	[player] join (group _inviter);
	
	systemChat "You have accepted the invite. You will now see them in your map and their name tag on their head.";
	systemChat "Press left windows key to toggle player icons";
} else {
	systemChat "The group no longer exists";    
};