#include "shortcuts.h"
_veh = _this sel 0;
_req = _this sel 1;
_typ = getText (xcf >> 'CfgVehicles' >> _veh >> 'displayName');
if (_veh isKindOf "AIR") then {_max = 2};
xcc ("
	if (isNil '"+_veh+"_DEPLOYED') then {"+_veh+"_DEPLOYED = 0};
	_required = "+str _req+";
	{if (_x in ((items player) + (magazines player))) then {_required set [_forEachIndex,objNull]}} forEach _required;
	_required = _required - [objNull];
	_findNearestPole = [60] call player_nearPP;
	_isNearPlot = count (_findNearestPole);
	if (_isNearPlot > 0) then {
		systemChat 'Cannot Deploy, You are near a plot pole.';
	} else {
		if (count _required <= 0) then {
			{player removeMagazine _x} forEach "+str _req+";
			[player,'repair',0,false,10] call dayz_zombieSpeak;
			[player,10,true,(getPosATL player)] spawn player_alertZombies;
			uiSleep 1;
			_dir = getdir (vehicle player);
			_pos = (vehicle player) call AH_fnc_getPos;
			PVOZ_OBJ_DEPLOY = [[(_pos select 0)+3*sin(_dir),(_pos select 1)+3*cos(_dir),(_pos select 2)+1],player,"+str _veh+"];
			publicVariableServer 'PVOZ_OBJ_DEPLOY';
			"+_veh+"_DEPLOYED = "+_veh+"_DEPLOYED + 1;
			cutText ['You used your toolbox to build a "+_typ+"!', 'PLAIN DOWN'];
			'<t size =''1'' font=''Zeppelin33'' color=''#FF0000''>Deployed vehicles disappear after server restart!</t>' call AH_fnc_dynTextMsg;
			player switchMove '';
		} else {systemChat ('(GG-AH): '+str ('You need: '+str _required+' to build "+_typ+".'))};
	};
");