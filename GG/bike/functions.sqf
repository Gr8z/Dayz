// this function checks if play is on ladder/passed out/being drug
fnc_can_do = {
    private["_onLadder"];
    _onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
    (!r_drag_sqf and !r_player_unconscious and !_onLadder)
};

fnc_set_temp_deployable_id = {
    _this setVariable ["DeployedBy",call fnc_temp_deployable_id, true]; 
};

fnc_set_perm_deployable_id = {
    _this setVariable ["CharacterID",call fnc_perm_deployable_id, true]; 
};

fnc_get_perm_deployable_id = {
    private["_return","_parse"];
    _return = _this getVariable ["CharacterID","0"];
    _parse = parseNumber _return;
    if(_parse < 500000) then {
        _return = "nil";
    };
    _return
};

fnc_get_temp_deployable_id = {
    _this getVariable ["DeployedBy","nil"]
};

fnc_perm_deployable_id = {
    private["_calc","_return"];
    _calc = 999999 - (parseNumber dayz_characterID);
    if(_calc < 500000) then {
        _return = "nil";
    } else {
        _return = (str _calc);
    };
   _return
};

fnc_temp_deployable_id = {
    getPlayerUID player  
};