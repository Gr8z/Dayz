private ['_result','_weapon_classname','_weapon_config_typeValue'];
_result = false;
_weapon_classname = _this select 0;
if (!isNil '_weapon_classname') then {
	_weapon_config_typeValue = getNumber (configFile >> 'CfgWeapons' >> _weapon_classname >> 'type');
	if (!isNil '_weapon_config_typeValue') then {
		if (_weapon_config_typeValue == 5) then {
			_result = true;
		} else {
			_result = false;
		};
	};
};

_result