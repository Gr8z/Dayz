TraderDialogCatList = 12000;
TraderDialogItemList = 12001;
TraderDialogBuyPrice = 12002;
TraderDialogSellPrice = 12003;
TraderDialogBuyBtn = 12004;
TraderDialogSellBtn = 12005;
TraderDialogCurrency = 12006;
TradeDialogDescription = 12069;
TraderCurrentCatIndex = -1;
TraderRefreshing = false;
TraderCatList = [];
TraderItemList = [];
TraderFinishTrade = {
	DZE_ActionInProgress = false;
	{player removeAction _x} forEach s_player_parts;
	s_player_parts = [];
	s_player_parts_crtl = -1;
};
TraderDialogRE = {
	sleep 0.1;
	waitUntil {(!DZE_ActionInProgress)};
	TraderRefreshing = true;
	[(lbCursel 12000)] call TraderDialogLoadItemList;
	[(lbCurSel 12001),(lbData [12710, (lbCurSel 12710)]),(ctrlText 12420)] call TraderDialogShowPrices;
};
TraderDialogLoadItemList = {
	private ["_index","_cfgTraderCategory","_item","_i","_type","_item_list"];
	
	call GG_getPlayerCargo;
	call GG_getBackpackCargo;
	call GG_getVehicleCargo;
	
	TraderItemList = [];
	_index = _this select 0;
	if (((_index < 0)||(TraderCurrentCatIndex == _index))&&(!TraderRefreshing)) exitWith {};
	TraderCurrentCatIndex = _index;
	lbClear TraderDialogItemList;
	
	if (!TraderRefreshing) then {
		((findDisplay 420420) displayCtrl TraderDialogCurrency) ctrlSetStructuredText parseText " ";
		((findDisplay 420420) displayCtrl TraderDialogBuyPrice) ctrlSetStructuredText parseText " ";
		((findDisplay 420420) displayCtrl TraderDialogSellPrice) ctrlSetStructuredText parseText " ";
		((findDisplay 420420) displayCtrl TradeDialogDescription) ctrlSetStructuredText parseText "<t color='#6fff00'>Green</t> = in inventory<br/><t color='#fdff00'>Yellow</t> = in backpack<br/><t color='#00f9ff'>Blue</t> = in vehicle<br/>";
		_cfgTraderCategory = (missionConfigFile >> "CfgTraderCategory" >> (format["Category_%1",(TraderCatList select _index)]));
		PVDZE_plr_TradeMenuResult = [];
		for "_i" from 0 to ((count _cfgTraderCategory) - 1) do {
			_item = configName (_cfgTraderCategory select _i);
			_type = (switch (true) do {
				default {""};
				case (isClass (configFile >> "CfgWeapons" >> _item)): {"CfgWeapons"};
				case (isClass (configFile >> "CfgMagazines" >> _item)): {"CfgMagazines"};
				case (isClass (configFile >> "CfgVehicles" >> _item)): {"CfgVehicles"};
			});
			PVDZE_plr_TradeMenuResult set [count PVDZE_plr_TradeMenuResult, [(configName (configFile >> _type >> _item)),(getNumber ((_cfgTraderCategory select _i) >> "buy")),(getNumber ((_cfgTraderCategory select _i) >> "sell")),(getText ((_cfgTraderCategory select _i) >> "type")),_type]];true
		};
	} else {TraderRefreshing = false};
	_item_list = [];
	{
		private ["_bqty","_sqty","_afile","_type","_textPart","_inside","_count","_index","_image","_bag","_bagclass"];
		_name 	= _x select 0;
		_bqty 	= _x select 1;
		_sqty 	= _x select 2;
		_afile 	= _x select 3;
		_type 	= _x select 4;
		_textPart = getText(configFile >> _type >> _name >> "displayName");
		_inside = "plyr";
		_count = 0;
		_index = lbAdd [TraderDialogItemList,format["%1 (%2)", _textPart, _name]];
		_image = getText(configFile >> _type >> _name >> "picture");
		if (_type == "CfgVehicles") then {
			if (_afile == "trade_backpacks") then {
				_bag = unitBackpack player;
				_bagclass = typeOf _bag;
				if (_name == _bagclass) then {_count = 1};
			} else {
				_count = count (nearestObjects [player, [_name], 80]);
			};
		};
		if (_type == "CfgMagazines") then {
			if (_name in GG_plyrmags) exitWith {lbSetColor [TraderDialogItemList, _index, [0, 1, 0, 1]]};
			if (_name in GG_bpmags) exitWith {_inside = "bp";lbSetColor [TraderDialogItemList, _index, [1, 1, 0, 1]]};
			if (_name in GG_vehmags) exitWith {_inside = "veh";lbSetColor [TraderDialogItemList, _index, [0, 1, 1, 1]]};
		};
		if (_type == "CfgWeapons") then {
			if (_name in GG_plyrweps) exitWith {lbSetColor [TraderDialogItemList, _index, [0, 1, 0, 1]]};
			if (_name in GG_bpweps) exitWith {_inside = "bp";lbSetColor [TraderDialogItemList, _index, [1, 1, 0, 1]]};
			if (_name in GG_vehweps) exitWith {_inside = "veh";lbSetColor [TraderDialogItemList, _index, [0, 1, 1, 1]]};
		};
		if (_count > 0) then {lbSetColor [TraderDialogItemList, _index, [0, 1, 0, 1]]};
		lbSetPicture [TraderDialogItemList, _index, _image];
		_item_list set [count _item_list, [_name,GCoins,[_bqty,_sqty],_textPart,"GG\Epoch\Trader\bs\" + _afile + ".sqf"]];
	} forEach PVDZE_plr_TradeMenuResult;
	TraderItemList = _item_list;
};
TraderDialogShowPrices = {
	private ["_old1","_old2","_index","_combo","_editb","_item","_bqty","_sqty","_qty","_di","_cfg","_dsc","_desc","_maxguns","_maxmags","_maxpacks","_crew","_free","_maxbuy","_canhold"];
	if (isNil "_this") exitWith {};
	if (count _this <= 1) exitWith {};
	if (typeName TraderItemList != "ARRAY") exitWith {[] spawn TraderDialogRE};
	if (count TraderItemList < 0) exitWith {[] spawn TraderDialogRE};
	if (isNil 'TD_updateloop') then {
		[] spawn {
			TD_updateloop = true;
			disableSerialization;
			_old1 = (ctrlText 12420);
			_old2 = (lbCurSel 12710);
			while {(!isNull (findDisplay 420420))} do {
				if ((_old1 != (ctrlText 12420))&&(!isNull (findDisplay 420420))) then {
					_old1 = (ctrlText 12420);
					[(lbCurSel 12001),(lbData [12710, (lbCurSel 12710)]),(ctrlText 12420)] spawn TraderDialogShowPrices;
				};
				if ((str _old2 != str (lbCurSel 12710))&&(!isNull (findDisplay 420420))) then {
					_old2 = (lbCurSel 12710);
					[(lbCurSel 12001),(lbData [12710, (lbCurSel 12710)]),(ctrlText 12420)] spawn TraderDialogShowPrices;
				};
				sleep 0.1;
			};
			TD_updateloop = nil;
		};
	};
	_index = _this select 0;
	_combo = _this select 1;
	_editb = parseNumber(_this select 2);
	if (_editb <= 0) then {_editb = 1};
	_item = TraderItemList select _index;
	_bqty = (_item select 2) select 0;
	_sqty = (_item select 2) select 1;
	_name = (_item select 0);
	
	((findDisplay 420420) displayCtrl TraderDialogBuyPrice) ctrlSetStructuredText parseText format["%1<br/><t color='#FFFF66'>%2</t>", [(_bqty * _editb)] call BIS_fnc_numberText, GCoins];
	ctrlEnable [TraderDialogBuyBtn, (player getVariable ["GGCoins",0] >= (_bqty * _editb))];
	((findDisplay 420420) displayCtrl TraderDialogSellPrice) ctrlSetStructuredText parseText format["%1<br/><t color='#FFFF66'>%2</t>", [(_sqty * _editb)] call BIS_fnc_numberText, GCoins];
	_qty = {_x == _name} count (switch (_combo) do {case "plyr": {GG_plyrmags+GG_plyrweps};case "bp": {GG_bpmags+GG_bpweps};case "veh": {GG_vehmags+GG_vehweps};});
	_di = _name;
	_cfg = (switch (true) do {
		default {''};
		case (isClass (configFile >> 'CfgWeapons' >> _di)): {'CfgWeapons'};
		case (isClass (configFile >> 'CfgMagazines' >> _di)): {'CfgMagazines'};
		case (isClass (configFile >> 'CfgVehicles' >> _di)): {'CfgVehicles'};
	});
	if (_cfg != 'CfgVehicles') then {ctrlEnable [TraderDialogSellBtn, !(_qty <= 0)]};
	_dsc = "";
	if (_cfg != '') then {
		_desc = (gettext (configFile >> _cfg >> _di >> 'Library' >> 'libTextDesc'));
		if (_cfg == 'CfgVehicles') then {
			_maxguns 	= getNumber (configFile >> _cfg >> _di >> "transportMaxWeapons");
			_maxmags 	= getNumber (configFile >> _cfg >> _di >> "transportMaxMagazines");
			_maxpacks 	= getNumber (configFile >> _cfg >> _di >> "transportMaxBackpacks");
			if ((_di isKindOf 'LandVehicle')||(_di isKindOf 'Air')||(_di isKindOf 'Ship')) then {
				_crew = getNumber (configFile >> _cfg >> _di >> "transportSoldier");
				_dsc = _dsc + ("<t size='0.7'><t color='#FF3300'>Crew</t>: "+str _crew+"<br/></t>");
			};
			_dsc = _dsc + ("<t size='0.7'><t color='#FF3300'>Max guns</t>: "+str _maxguns+"<br/></t>");
			_dsc = _dsc + ("<t size='0.7'><t color='#FF3300'>Max mags</t>: "+str _maxmags+"<br/></t>");
			_dsc = _dsc + ("<t size='0.7'><t color='#FF3300'>Max backpacks</t>: "+str _maxpacks+"<br/></t>");
			_dsc = _dsc + (if (_desc != "") then {"<t size='0.65'>"+_desc+"</t>"} else {("No description for ""<t color='#FF3300'>"+_di+"</t>""")});
		} else {
			_dsc = _dsc + (if (_desc != "") then {"<t size='0.65'>"+_desc+"</t>"} else {("No description for ""<t color='#FF3300'>"+_di+"</t>""")});
		};
	};
	((findDisplay 420420) displayCtrl TradeDialogDescription) ctrlSetStructuredText parseText _dsc;
	if (_cfg == 'CfgVehicles') then {
		lbSetCurSel [12710,0];
		((findDisplay 420420) displayCtrl TraderDialogCurrency) ctrlSetStructuredText parseText " ";
	} else {
		_free = (switch (_combo) do {
			case "plyr": {(([player] call BIS_fnc_invSlotsEmpty) select 4)};
			case "bp": {((GG_bpobj call GG_checkFreeSlotsBP) select 0)};
			case "veh": {if (_cfg == 'CfgWeapons') then {((GG_vehobj call GG_checkFreeSlotsVEH) select 1)} else {((GG_vehobj call GG_checkFreeSlotsVEH) select 0)}};
		});
		_maxbuy = floor((player getVariable ["GGCoins",0]) / _bqty);
		_canhold = floor(_free / (_name call GG_countReqWepSlots));
		if (_maxbuy > _free) then {_maxbuy = _free};
		if (_maxbuy > _canhold) then {_maxbuy = _canhold};
		((findDisplay 420420) displayCtrl TraderDialogCurrency) ctrlSetStructuredText parseText ("<t color='#FF3300'align='left'>Free slots</t>: "+str _free+" <t color='#FF3300'align='left'>Max buy</t>: "+str _maxbuy+" <t color='#FF3300'align='left'>Max sell</t>: "+(str _qty));
	};
};
TraderDialogBuy = {
	if (isNil "_this") exitWith {};
	if (count _this <= 1) exitWith {};
	private ["_index","_item","_data"];
	_index = _this select 0;
	_combo = _this select 1;
	_editb = parseNumber(_this select 2);
	if (_editb <= 0) then {_editb = 1};
	if (_index < 0) exitWith {cutText [(localize "str_epoch_player_6"),"PLAIN DOWN"]};
	[] spawn TraderDialogRE;
	_item = TraderItemList select _index;
	
	_data = [_item select 0, _item select 1, (_item select 2) select 0,"buy", _item select 3, _combo, _editb];
	_data execVM (_item select 4);
};
TraderDialogSell = {
	if (isNil "_this") exitWith {};
	if (count _this <= 1) exitWith {};
	private ["_index","_item","_data"];
	_index = _this select 0;
	_combo = _this select 1;
	_editb = parseNumber(_this select 2);
	if (_editb <= 0) then {_editb = 1};
	if (_index < 0) exitWith {cutText [(localize "str_epoch_player_6"),"PLAIN DOWN"]};
	[] spawn TraderDialogRE;
	_item = TraderItemList select _index;
	
	_data = [_item select 0, _item select 1, (_item select 2) select 1,"sell", _item select 3, _combo, _editb];
	_data execVM (_item select 4);
};