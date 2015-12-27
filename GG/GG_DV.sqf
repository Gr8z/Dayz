#include "shortcuts.h"
_veh = _this sel 0;
_req = _this sel 1;
_typ = getText (xcf >> 'CfgVehicles' >> _veh >> 'displayName');
_max = 6;
if (_veh isKindOf "AIR") then {_max = 2};
xcc ("
	if (isNil '"+_veh+"_DEPLOYED') then {"+_veh+"_DEPLOYED = 0};
	if ("+_veh+"_DEPLOYED > "+str _max+") exitWith {systemChat ('(GG-AH): '+str (format ['You have built %1 out of a maximum of "+str _max+" "+_typ+".',"+_veh+"_DEPLOYED]))};
	if (dayz_combat == 1) exitWith {systemChat ('(GG-AH): '+str ('You can''t deploy vehicles while in combat!'))};
	_required = "+str _req+";
	{if (_x in ((items player) + (magazines player))) then {_required set [_forEachIndex,objNull]}} forEach _required;
	_required = _required - [objNull];
	if (count _required <= 0) then {
		player playActionNow 'Medic';
		{player removeMagazine _x} forEach "+str _req+";
		[player,'repair',0,false,10] call dayz_zombieSpeak;
		[player,10,true,(getPosATL player)] spawn player_alertZombies;
		uiSleep 6;
		_dir = getdir (vehicle player);
		_pos = (vehicle player) call AH_fnc_getPos;
		PVOZ_OBJ_DEPLOY = [[(_pos select 0)+3*sin(_dir),(_pos select 1)+3*cos(_dir),(_pos select 2)+1],player,"+str _veh+"];
		publicVariableServer 'PVOZ_OBJ_DEPLOY';
		"+_veh+"_DEPLOYED = "+_veh+"_DEPLOYED + 1;
		if (floor(random 100) > 85) then {
			r_player_infected = true;
			player setVariable ['USEC_infected',true];
			addCamShake [55, 0.6, 111];
			cutText ['You used your toolbox to build a "+_typ+"! It looks like you cut yourself in the process.. You feel the infection setting in..','PLAIN DOWN'];
		} else {cutText ['You used your toolbox to build a "+_typ+"!', 'PLAIN DOWN']};
		systemChat ('(GG-AH): '+str (format ['You have built a "+_typ+"! You have built %1 out of a maximum of %2 "+_typ+".!',"+_veh+"_DEPLOYED,"+str _max+"]));
		'<t size =''1'' font=''Zeppelin33'' color=''#FF0000''>Deployed vehicles disappear after server restart!</t>' call AH_fnc_dynTextMsg;
		player switchMove '';
	} else {systemChat ('(GG-AH): '+str ('You need: '+str _required+' to build "+_typ+".'))};
");
