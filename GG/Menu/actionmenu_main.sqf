_pathtoscripts = "GG\menu\tools\";
_pathtocolors = "GG\menu\sky\";
_pathtofog = "GG\menu\fog\";
_pathtodonations = "GG\menu\donations\";
_pathtobuilding = "GG\menu\building\";
_pathtoPack = "GG\deployables\";
_pathtoclothing = "GG\menu\wardrobe\";
_pathtoGroup = "GG\group\";
_pathtoAirDrop = "GG\";
_pathtoPlayerStats = "GG\actions\";

_EXECscript1 = 'player execVM "'+_pathtoscripts+'%1"';
_EXECscript2 = 'player execVM "'+_pathtocolors+'%1"';
_EXECscript4 = 'setviewdistance %1;';
_EXECscript5 = 'player execVM "'+_pathtodonations+'%1"';
_EXECscript6 = 'player execVM` "'+_pathtobuilding+'%1"';
_EXECscript7 = '["%1"] execVM "GG\deployables\deploy.sqf"';
_EXECscript8 = 'player execVM  "'+_pathtoPack+'%1"';
_EXECscript9 = '["%1"] execVM "GG\menu\tools\movements.sqf"';
_EXECscript10 = '[] spawn %1;';
_EXECscript11 = 'player execVM "'+_pathtoclothing+'%1"';
_EXECscript12 = 'player execVM "'+_pathtoGroup+'%1"';
_EXECscript13 = 'player execVM "'+_pathtoAirDrop+'%1"';
_EXECscript14 = 'player execVM "'+_pathtoPlayerStats+'%1"';

_toggleGrass = {
	if (profileNamespace getVariable ['AH_nograss',false]) then {
		profileNamespace setVariable ['AH_nograss',false];
		saveProfileNamespace;
		
		setTerrainGrid 5;
		_msg = 'Grass enabled!';
		systemChat _msg;
		_msg call AH_fnc_dynTextMsg;
	} else {
		profileNamespace setVariable ['AH_nograss',true];
		saveProfileNamespace;
		
		setTerrainGrid 100;
		_msg = 'Grass disabled!';
		systemChat _msg;
		_msg call AH_fnc_dynTextMsg;
	};
};

_viewDistance = {
	view_distance_change = {
		if (_this == "") exitWith {};
		_setting 	= parseNumber _this;
		if ((_setting >= 100)&&(_setting <= 10000)) then {
			dayzSetViewDistanceAH = _setting;
			setViewDistance _setting;
			
			profileNamespace setVariable ['AH_viewdistance',_setting];
			saveProfileNamespace;
			
			_msg = "Your view distance has been set to '+str _setting+', and shall be set to this on each login.";
			_msg call AH_fnc_dynTextMsg;
			systemChat _msg;
		} else {
			if (_setting > 10000) then {
				_msg = str(_setting)+" is too high, you can only set your view distance to a maximum of 10000.";
				_msg call AH_fnc_dynTextMsg;
				systemChat _msg;
			};
			if (_setting < 100) then {
				_msg = str(_setting)+" is too low, you can only set your view distance to a minimum of 100.";
				_msg call AH_fnc_dynTextMsg;
				systemChat _msg;
			};
		};
	};
	disableSerialization;
	['Set local viewdistance','Distance:','Set','view_distance_change'] call AH_fnc_displayCreate;
};

ActionMenu =
[
	["",true],
		["Action Menu >>", [], "#USER:ActionMenua", -5, [["expression", ""]], "1", "1"],
		["Color Filters Menu >>", [], "#USER:SkyMenu", -5, [["expression", ""]], "1", "1"],
		["Toggle Earplugs >>", [], "#USER:EarMenu", -5, [["expression", ""]], "1", "1"],
		["Toggle Environmental sounds >>", [], "#USER:environment", -5, [["expression", ""]], "1", "1"],
		["Toggle Grass >>", [], "", -5, [["expression", format[_EXECscript10,"_toggleGrass"]]], "1", "1"],
		["Wardrobe Menu >>", [], "#USER:wardrobe", -5, [["expression", ""]], "1", "1"],
		["View Distance (Fog) Menu >>", [], "", -5, [["expression", format[_EXECscript10,"_viewDistance"]]], "1", "1"],
		["Group Menu >>", [], "", -5, [["expression", format[_EXECscript12,"loadGroupManagement.sqf"]]], "1", "1"],
            ["", [], "", -5, [["expression", ""]], "1", "0"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ActionMenua =
[
	["",true],
		["Flip Vehicle", [2],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
		["Call Air Drop (10k Coins)", [3],  "", -5, [["expression", format[_EXECscript13,"GG_PD.sqf"]]], "1", "1"],
		["Scan Players (1000m)", [4],  "", -5, [["expression", format[_EXECscript13,"GG_SP.sqf"]]], "1", "1"],
		["Self Bloodbag", [5],  "", -5, [["expression", format[_EXECscript1,"bloodbag.sqf"]]], "1", "1"],
		["Commit Suicide", [6],  "", -5, [["expression", format[_EXECscript1,"suicide.sqf"]]], "1", "1"],
		["Scream", [7],  "", -5, [["expression", "_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;[nil,player,rSAY,[_sound,250]] call RE;"]], "1", "1"],
		["Hints & Tips - Read Me!", [8],  "", -5, [["expression", format[_EXECscript1,"help.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

SkyMenu =
[
["",true],
        ["Normal", [11],  "", -5, [["expression", format[_EXECscript2 ,"normal.sqf"]]], "1", "1"],
        ["Contrast", [2],  "", -5, [["expression", format[_EXECscript2 ,"clear.sqf"]]], "1", "1"],
        ["Wasteland", [3],  "", -5, [["expression", format[_EXECscript2 ,"wasteland.sqf"]]], "1", "1"],
        ["Color Buff", [4],  "", -5, [["expression", format[_EXECscript2 ,"colorbuff.sqf"]]], "1", "1"],
        ["Summer", [5],  "", -5, [["expression", format[_EXECscript2 ,"summer.sqf"]]], "1", "1"],
        ["Africa", [6],  "", -5, [["expression", format[_EXECscript2 ,"africa.sqf"]]], "1", "1"],
        ["Tropical", [7],  "", -5, [["expression", format[_EXECscript2 ,"tropical.sqf"]]], "1", "1"],
        ["Flashpoint", [8],  "", -5, [["expression", format[_EXECscript2 ,"flashpoint.sqf"]]], "1", "1"],
        ["Dark Drain", [9],  "", -5, [["expression", format[_EXECscript2 ,"darkdrain.sqf"]]], "1", "1"],
        ["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

EarMenu =
[
	["",true],
	["ON", [2],  "", -5, [["expression","1 fadeSound 0.2;enableEnvironment false;((uiNamespace getVariable 'EarPlugs') displayCtrl 1) ctrlSetStructuredText parseText ""<t size='4' align='left' valign='middle'><img image='GG\images\earplugs.paa' /></t>"";GGEARPLUGS = false;"]], "1", "1"],
	["OFF", [3],  "", -5, [["expression","1 fadeSound 1;enableEnvironment true;((uiNamespace getVariable 'EarPlugs') displayCtrl 1) ctrlSetStructuredText parseText '';GGEARPLUGS = true;"]], "1", "1"]
];

environment =
[
	["",true],
	["ON", [2],  "", -5, [["expression","enableEnvironment true;"]], "1", "1"],
	["OFF", [3],  "", -5, [["expression","enableEnvironment false;"]], "1", "1"]
];

wardrobe =
[
	["",true],
		["Men Clothing", [2], "", -5, [["expression", format[_EXECscript11,"open_dialog.sqf"]]], "1", "1"],
		["Women Clothing", [3], "", -5, [["expression", format[_EXECscript11,"open_dialog2.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:ActionMenu";