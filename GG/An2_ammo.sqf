private["_ammo","_vehicle","_hasAmmo","_text","_weapon","_weaponname","_ammoname"];

_vehicle = _this select 0;
_weapon = "PKT"; //vehicleweapon
_ammo = "100Rnd_762x54_PKR"; //weaponammo
_weaponname = _weapon; //cant read from config, coz there is no turret or what ever - so its hardcoded
_ammoname = getText (configFile >> "cfgMagazines" >> _ammo >> "displayName");
_text = [_ammoname,_weaponname];
_hasAmmo = _ammo in magazines player;

if (_hasAmmo) exitWith {
    player removeMagazine _ammo;
    ["<t size='0.6'>3</t>",0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
    sleep 1;
    ["<t size='0.6'>2</t>",0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
    sleep 1;
    ["<t size='0.6'>1</t>",0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
    sleep 1;
    _vehicle addMagazine _ammo;
    cutText [format[(localize "str_epoch_player_127"),_ammoname], "PLAIN DOWN"];
};

cutText [format[(localize "str_epoch_player_128"),_text], "PLAIN DOWN"];
