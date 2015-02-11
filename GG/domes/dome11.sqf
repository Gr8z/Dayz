Private ["_EH_Fired"];

/////////////////////////////////////
////////////////////////////////////

//  Base 11 (122130)

////////////////////////////////////
/////////////////////////////////////
if ((getPlayerUID player) in [
	"76561198058306042", // cjlatch125
	"76561198065694603", // cjlatch125 2
	"76561198046592050", // cjlatch125 3
	"76561198079466045", // cjlatch125 4
	"76561198057849869", // cjlatch125 5
	"76561198063846968", // cjlatch125 6
	"76561198116799122", // cjlatch125 7
	"76561198042359053", // cjlatch125 8
	"76561198116980684", // cjlatch125 9
"0"
]+adminBuild) then {
titleText [format ["Welcome To the Base #122130, %1. God Mode Turn On. Weps Disabled", name player], "PLAIN DOWN"];

_thePlayer = player;

while {true} do {
sleep 1;
player_zombieCheck = {};
fnc_usec_damageHandler = {};
_thePlayer removeAllEventHandlers "handleDamage";
_thePlayer addEventHandler ["handleDamage", {false}];
_thePlayer allowDamage false;
};
_EH_Fired = _thePlayer addEventHandler ["Fired", {
systemChat ("You can not fire your weapon in a Donor Base");
NearestObject [_this select 0,_this select 4] setPos[0,0,0];
}];

} else {
// What happens if unauthorized players get into the dome
titleText ["YOU ARE IN A [GG] RESTRICTED ZONE, YOU HAVE 15 SECONDS TO LEAVE!", "WHITE IN", 3];
sleep 5;
titleText ["ARE YOU BLIND? YOU NOW HAVE 10 SECONDS TO COMPLY!", "PLAIN DOWN", 3];
sleep 5;
titleText ["YOU HAVE BEEN WARNED, 5 SECONDS UNTIL YOU ARE TELEPORTED!", "PLAIN DOWN", 3];
sleep 5;
player setPos [[13735.944, 4135.0098, 9.9420547];
};