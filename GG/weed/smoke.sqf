 private ["_chance", "_drugTrip", "_trip"];
 

_chance = floor(random 100);
_trip = _this select 2;
_drugTrip = time + 60 + (_trip * 2);

player playActionNow "Medic";
sleep 1;
liafu = true;
Flare = "SmokeShell" createVehicle position player;
if (vehicle player != player) then { 
	Flare attachTo [vehicle player,[0,0,0.]];}
else {
	Flare attachTo [player,[0,0,0.]];
};
_nul = [objNull, player, rSAY, "cough"] call RE;
sleep 5;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
 
       
    titleText ["You are stoned !","PLAIN DOWN"]; titleFadeOut 5;
    while {time < _drugTrip} do {

        _force = random 10;
        "chromAberration" ppEffectEnable true;
        "chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
        "chromAberration" ppEffectCommit (0.3 + random 0.1);
        waituntil {ppEffectCommitted "chromAberration"};
        r_player_inpain = false;
        player setVariable["USEC_inPain",false,false];
        r_player_injured = false;
        player setVariable ["USEC_injured",false,false];
        player setVariable ["NORRN_unconscious", false, false];
        player setVariable ["unconsciousTime", 0, false];
        r_fracture_legs = false;
        player setVariable ["medForceUpdate",true,true];
        r_fracture_arms = false;
        player setHit["legs",0];
        player setHit["hands",0];    
        
        sleep 0.6;

        };  

"colorInversion" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
 titleText ["Your brain is finally starting to feel normal again.","PLAIN DOWN"]; titleFadeOut 5;
 r_player_inpain = false;
player setVariable["USEC_inPain",false,false];
r_player_injured = false;
player setVariable ["USEC_injured",false,false];
r_fracture_legs = false;
player setVariable ["medForceUpdate",true,true];
r_fracture_arms = false;
player setHit["legs",0];
player setHit["hands",0];