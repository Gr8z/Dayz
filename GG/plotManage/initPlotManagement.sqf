_adminList = ["0152"]; // Add admins here if you admins to able to manage all plotpoles
_owner = _cursorTarget xgv ["CharacterID","0"];
_friends = _cursorTarget xgv ["plotfriends", []];
_fuid = [];
{
    _friendUID = _x sel 0;
    _fuid = _fuid + [_friendUID];
} forEach _friends;
_allowed = [_owner]; 
_allowed = [_owner] + _adminList + _fuid;
if(_owner == dayz_characterID || (gpd player) in _allowed)then{            
	createdialog "PlotManagement";
	call PlotNearbyHumans;
	call PlotGetFriends;
	["preview"] call MaintainPlot;
	call PlotObjects;
} else {
	cutText ["You do not have the rights to manage.","PLAIN DOWN"];
}