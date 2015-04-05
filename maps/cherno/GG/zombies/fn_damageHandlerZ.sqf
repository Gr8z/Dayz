private["_zed","_selection","_damage","_hitter","_projectile","_headShots","_damageOrg"];

_zed = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_hitter = _this select 3;
_projectile = _this select 4;

private ["_unit","_damage","_ammo","_gethit","_damMults"];

_ammo=_this select 4;

_damMults=[0.001,0.5,0.002,0.003,0.4];

if (isNil {_zed getVariable "gethit"}) then {_zed setVariable ["gethit",[0,0,0,0]]};
_gethit=_zed getVariable "gethit";

switch (_this select 1) do {
    case "":{
        _damage=damage _zed+_damage*(_damMults select 0)
    };
    
    case "head_hit":{
        _damage=(_gethit select 0)+(_damage-(_gethit select 0))*(_damMults select 1);_gethit set [0,_damage]
    };
    
    case "body":{
        _damage=(_gethit select 1)+(_damage-(_gethit select 1))*(_damMults select 2);_gethit set [1,_damage]
    };
    
    case "hands":{
        _damage=(_gethit select 2)+(_damage-(_gethit select 2))*(_damMults select 3);_gethit set [2,_damage]
    };
    
    case "legs":{
        _damage=(_gethit select 3)+(_damage-(_gethit select 3))*(_damMults select 4);_gethit set [3,_damage]
    };
};

if (local _zed) then {
	if (_damage > 1 && _projectile != "") then {
		switch (_selection) do {
			case "head_hit": {
				if (!(_zed getVariable["hitRegistered",false])) then {
					_headShots = _hitter getVariable["headShots",0];
					_hitter setVariable["headShots",(_headShots + 1),true];
					_zed setVariable["hitRegistered",true];
				};
			};
		};
		if (_projectile isKindOf "Bolt") then {
			_damageOrg = _hitter getVariable["firedDamage",0];
			if (_damageOrg < _damage) then {
				_hitter setVariable["firedHit",[_zed,_selection],true];
				_hitter setVariable["firedDamage",_damage,true];
			};
		};
	};
};
_damage