

_adminList = [leveltwo+levelthree];
_owner = cursorTarget getVariable ["CharacterID","0"];
_friends = cursorTarget getVariable ["plotfriends", []];
_fuid = [];
{
    _friendUID = _x select 0;
    _fuid = _fuid + [_friendUID];
} forEach _friends;
_allowed = [_owner]; 
_allowed = [_owner] + _adminList + _fuid;
if(_owner == PIDP_playerUID || (getPlayerUID player) in _allowed)then{            
	createdialog "PlotManagement";
	call PlotNearbyHumans;
	call PlotGetFriends;
	["preview"] call MaintainPlot;
	call PlotObjects;
} else {
	cutText ["You do not have the rights to manage.","PLAIN DOWN"];
}