 [] spawn {
    hint "You just smoked a huge blunt! Feel the high kick in! (lasts 90 seconds)";
    player removeMagazine 'ItemKiloHemp';
    player setDamage 0;
    r_player_inpain = false;
    r_player_injured = false;
    dayz_hunger    = dayz_hunger + 0.4;
    dayz_thirst = dayz_thirst + 0.4;
    r_player_lowblood = 	false;
    dayz_sourceBleeding =	objNull;
    player setVariable ["USEC_injured",false,true];
   {player setVariable[_x,false,true];} forEach USEC_woundHit;
    player setVariable['medForceUpdate',true,true];
    Remove_Drug_effects =
    {
    {
    {
    ppEffectDestroy _x;
    } forEach (_this select 0);
    ppEffectDestroy ppe2;
    ppEffectDestroy ppe3;
    setaperture 0;
    };
    _time = time;
    _effects = [];
    player playMoveNow "ActsPercMstpSnonWpstDnon_sceneBardak01";
    while {true} do
    {
	Flare = "SmokeShellGreen" createVehicle position player;
	if (vehicle player != player) then { Flare attachTo [vehicle player,[0,0,0.]];}
	else {Flare attachTo [player,[0,0,0.]];}
    ppe2 = ppEffectCreate ["chromAberration", 1555];
    _effects = _effects + [ppe2];
    ppe2 ppEffectAdjust [random 0.25,random 0.25,true];
    ppe2 ppEffectCommit 1;
    ppe2 ppEffectEnable true;
    ppe3 = ppEffectCreate ["radialBlur", 1555];
    _effects = _effects + [ppe3];
    ppe3 ppEffectEnable true;
    ppe3 ppEffectAdjust [random 0.02,random 0.02,0.15,0.15];
    ppe3 ppEffectCommit 1;
    sleep random(1);
    if (_time + 90 < time) exitWith {[_effects] call Remove_Drug_effects;};
 };