fnc_preview_weapon =
{
	if (!isNil 'TraderItemList') then
	{
		if (typeName TraderItemList == 'ARRAY') then
		{
			if (count TraderItemList > 0) then
			{
				_item = (TraderItemList select (lbCurSel 12001) select 0);
				_status = 'no';
				if (isClass (configFile >> 'CfgWeapons' >> _item)) then
				{
					_status = 'CfgWeapons';
				};
				if (isClass (configFile >> 'CfgMagazines' >> _item)) then
				{
					_status = 'CfgMagazines';
				};
				if (isClass (configFile >> 'CfgVehicles' >> _item)) then
				{
					_status = 'CfgVehicles';
				};
				if (_status != 'no') then
				{
					_pic = (getText (configFile >> _status >> _item >> 'picture'));
					['
						<img size=''5'' image='''+_pic+'''/>
					',0,safezoneY+0.01,15,0,0,8406] spawn bis_fnc_dynamicText;
					
					_txt = (gettext (configFile >> _status >> _item >> 'Library' >> 'libTextDesc'));
					['
						<t size=''0.4'' font=''TahomaB''>'+_txt+' </t>
					',0,0.8 * safezoneH + safezoneY,15,0,0,8407] spawn bis_fnc_dynamicText;
				};
			};
		};
	};
};
fnc_wait_for_preview_weaponclosed =
{
	disableSerialization;
	waitUntil {uiSleep 0.5;isNull (findDisplay 420420)};
	['',0,0,0,0,0,8406] spawn bis_fnc_dynamicText;
	['',0,0,0,0,0,8407] spawn bis_fnc_dynamicText;
	[] spawn fnc_wait_for_preview_weapon;
};
fnc_wait_for_preview_weapon =
{
	disableSerialization;
	waitUntil {uiSleep 0.5;!isNull (findDisplay 420420)};
	_ctrl = (findDisplay 420420) displayCtrl 12001;
	_ctrl ctrlSetEventHandler ['LBSelChanged', 'call fnc_preview_weapon;'];
	[] spawn fnc_wait_for_preview_weaponclosed;
};
[] spawn fnc_wait_for_preview_weapon;