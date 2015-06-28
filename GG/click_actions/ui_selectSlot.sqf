private ["_control","_button","_parent","_group","_pos","_item","_conf","_name","_cfgActions","_numActions","_height","_menu","_config","_type","_script","_outputOriented","_compile","_array","_outputClass","_outputType"];
disableSerialization;
_control =  _this select 0;
_button =   _this select 1;
_parent =   findDisplay 106;

//if ((time - dayzClickTime) < 1) exitWith {};
if (!DZE_SelfTransfuse && ((gearSlotData _control) == "ItemBloodBag")) exitWith {};
if (_button == 1) then {
    //dayzClickTime = time;
    _group = _parent displayCtrl 6902;
    
    _pos =      ctrlPosition _group;
    _pos set [0,((_this select 2) + 0.48)];
    _pos set [1,((_this select 3) + 0.07)];
    
    _item = gearSlotData _control;
	_rcDisabled = ["vil_20Rnd_762x51_G3"];
	if (_item in _rcDisabled) exitWith {cutText ["This option is disabled on this server.", "PLAIN DOWN"];};
    
    _conf = configFile >> "cfgMagazines" >> _item;
    if (!isClass _conf) then {
        _conf = configFile >> "cfgWeapons" >> _item;
    };
    _name = getText(_conf >> "displayName");
    
    _cfgActions = _conf >> "ItemActions";
    _numActions = (count _cfgActions);
    _height = 0;
    
    //Populate Menu
    for "_i" from 0 to (_numActions - 1) do 
    {
        _menu =     _parent displayCtrl (1600 + _i);
        _menu ctrlShow true;
        _config =   (_cfgActions select _i);
        _type =     getText (_config >> "text");
        _script =   getText (_config >> "script");
        _outputOriented =   getNumber   (_config >> "outputOriented") == 1;
        _height = _height + (0.025 * safezoneH);
        _compile =  format["_id = '%2' %1;",_script,_item];
        uiNamespace setVariable ['uiControl', _control];
        if (_outputOriented) then {
            /*
                This flag means that the action is output oriented
                the output class will then be transferred to the script
                && the type used for the name
            */          
            _array =    getArray    (_config >> "output");
            _outputClass = _array select 0;
            _outputType = _array select 1;
            _name = getText (configFile >> _outputType >> _outputClass >> "displayName");
            _compile =  format["_id = ['%2',%3] %1;",_script,_item,_array];
        };
        
        _menu ctrlSetText format[_type,_name];
        _menu ctrlSetEventHandler ["ButtonClick",_compile];
    };
	
	// key colors
        _colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
		if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _item)) in _colors) then {
            // characterID of the key (car character number)
			_keyOwner = getNumber(configFile >> "CfgWeapons" >> _item >> "keyid");
            // key name (like: e3f2)
            _keyName = getText(configFile >> "CfgWeapons" >> _item >> "displayName");

            //Menu entry Key vehicle pointer
            _control =  _parent displayCtrl (1600 + _numActions);
            _control ctrlShow true;
            _height = _height + (0.025 * safezoneH);
            _script =  "GG\vehicle_pointer.sqf";
            _exescript = format["_id = ['%2','%3'] execVM '%1';closeDialog 0;",_script,_keyOwner,_keyName];
            uiNamespace setVariable ['uiControl', _control];
            // sets the text in the right button menu
            _control ctrlSetText "Vehicle Pointer";
            _control ctrlSetTextColor [0.3,0.4,1,1];
            _control ctrlSetTooltip "Pinpoint vehicle. Mark on map if not in range.";
            _control ctrlSetTooltipColorBox [0.3,0.4,1,1];
            _control ctrlSetTooltipColorShade [0, 0, 0, 1];
            _control ctrlSetTooltipColorText [0.3,0.4,1,1];
            _control ctrlSetEventHandler ["ButtonClick",_exescript];
            _numActions = _numActions + 1; // if there are other item action after that (other mods) add 1 to _numactions
		};

    //### BEGIN MODIFIED CODE: extra click actions
    {
        private["_classname","_text","_execute","_condition"];
        _classname   = _x select 0;
        _text        = _x select 1;
        _execute     = _x select 2;
        _condition   = _x select 3;
        // if the clicked item matches, then assign the script call and display text
        if(_item == _classname && (call compile _condition)) then {
            _menu = _parent displayCtrl (1600 + _numActions);
            _menu ctrlShow true;
            _height = _height + (0.025 * safezoneH);
            uiNamespace setVariable ['uiControl', _control];
            _menu ctrlSetText _text;
            _menu ctrlSetEventHandler ["ButtonClick",_execute];
            _numActions = _numActions + 1;
        };
    } forEach DZE_CLICK_ACTIONS;
    //### END MODIFIED CODE: extra click actions

	/*
		Begin: Vehicle remote lock/unlock
	*/
		_itemsPlayer = items player;
		
		_temp_keys = [];
		_temp_keys_names = [];
		// find available keys
		_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
		if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _item)) in _key_colors) then {
			_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _item >> "keyid");
			_ownerKeyName = getText(configFile >> "CfgWeapons" >> _item >> "displayName");
			_temp_keys_names set [_ownerKeyId,_ownerKeyName];
			
			_objects = nearestObjects [getPos player, ["LandVehicle","Helicopter","Plane","Ship"], 50];
			_i = 0;
			{
				if (alive _x) then {
					_ownerID = _x getVariable ["CharacterID", "0"];
					_hasKey = (_ownerID == str(_ownerKeyId));
					_oldOwner = (_ownerID == dayz_playerUID);

					if(_hasKey or _oldOwner) then {
						if(locked _x) then {
							//Unlock
							_menu =  _parent displayCtrl (1600 + _numActions);
							_menu ctrlShow true;
							_text =  "Unlock";
							_script =  "[""" + _ownerID + """] execVM ""GG\remote\remote_unlock.sqf""";
							_height = _height + (0.025 * safezoneH);
							uiNamespace setVariable ['uiControl', _control];
							_menu ctrlSetText _text;
							_menu ctrlSetEventHandler ["ButtonClick",_script];
						} else {
							//Lock
							_menu =  _parent displayCtrl (1600 + _numActions);
							_menu ctrlShow true;
							_text =  "Lock";
							_script =  "[""" + _ownerID + """] execVM ""GG\remote\remote_lock.sqf""";
							_height = _height + (0.025 * safezoneH);
							uiNamespace setVariable ['uiControl', _control];
							_menu ctrlSetText _text;
							_menu ctrlSetEventHandler ["ButtonClick",_script];
						};
						
						if (isEngineOn _x) then {
							//Engine stop
							_menu =  _parent displayCtrl (1600 + _numActions + 1);
							_menu ctrlShow true;
							_text =  "Stop";
							_script =  "[""" + _ownerID + """] execVM ""GG\remote\remote_start.sqf""";
							_height = _height + (0.025 * safezoneH);
							uiNamespace setVariable ['uiControl', _control];
							_menu ctrlSetText _text;
							_menu ctrlSetEventHandler ["ButtonClick",_script];
						} else {
							//Engine start
							_menu =  _parent displayCtrl (1600 + _numActions + 2);
							_menu ctrlShow true;
							_text =  "Start";
							_script =  "[""" + _ownerID + """] execVM ""GG\remote\remote_start.sqf""";
							_height = _height + (0.025 * safezoneH);
							uiNamespace setVariable ['uiControl', _control];
							_menu ctrlSetText _text;
							_menu ctrlSetEventHandler ["ButtonClick",_script];
						};
						
						//Eject Crew
						_menu =  _parent displayCtrl (1600 + _numActions + 2);
						_menu ctrlShow true;
						_text =  "Eject Crew";
						_script =  "[""" + _ownerID + """] execVM ""GG\remote\remote_eject.sqf""";
						_height = _height + (0.025 * safezoneH);
						uiNamespace setVariable ['uiControl', _control];
						_menu ctrlSetText _text;
						_menu ctrlSetEventHandler ["ButtonClick",_script];
											
					};
					
					_i = _i + 1;
				};
			} forEach _objects;
		};
	/*
		End: Vehicle remote lock/unlock
	*/
	
    _pos set [3,_height];
    //hint format["Obj: %1 \nHeight: %2\nPos: %3",_item,_height,_grpPos];       

    _group ctrlShow true;
    ctrlSetFocus _group;
    _group ctrlSetPosition _pos;
    _group ctrlCommit 0;
};