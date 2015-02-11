Private ["_EH_Fired"];

/////////////////////////////////////
////////////////////////////////////

//  Base 12 (006143)

////////////////////////////////////
/////////////////////////////////////
if ((getPlayerUID player) in [
"0"
]+adminBuild) then {
titleText [format ["Welcome To the Base #006143, %1. God Mode Turn On. Weps Disabled", name player], "PLAIN DOWN"];

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
player setPos [[474.59802, 1516.2065, -3.2901764];
};