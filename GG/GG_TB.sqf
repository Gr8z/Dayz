#include "shortcuts.h"
player rac s_player_teabag;
s_player_teabag = -1;
_sfx = "dog_growl";
[player,_sfx,0,false,5] call dayz_zombieSpeak;
_body = _this sel 3;
_body attachTo [(vehicle player),[0,1.95,0]];
[objNull, _body, rSWITCHMOVE, "CivilDead01"] call RE;
[objNull, player, rSWITCHMOVE, "AmovPercMstpSnonWnonDnon_idle69drepy"] call RE;
player groupChat "TEA";
uiSleep 11;
player groupChat "BAGGED";
uiSleep 11.25;
[player,-20] call player_humanityChange;
[objNull, player, rSWITCHMOVE, ""] call RE;
[objNull, _body, rSWITCHMOVE, ""] call RE;
detach _body;
