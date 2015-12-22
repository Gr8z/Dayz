private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Land_fortified_nest_big",[-2.30457, 3.43677],116.481,1,0,{}],
	["Land_Chair_EP1",[2.03894, 2.29846],212.826,1,0,{}],
	["Land_Barrel_water",[-3.32288, -0.419922],2.43314,1,0,{}],
	["FoldTable",[1.10376, 3.23315],295.193,1,0,{}],
	["Land_bags_stack_EP1",[-4.69006, 0.628906],0.0643673,1,0,{}],
	["Land_Antenna",[2.54724, 7.80029],299.797,1,0,{}],
	["HeliHCivil",[-6.65979, -8.96411],0,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;

["FR_Commander", [_x + 2.35327,_y + 3.38037], (115-180)] call DT_fnc_CreateTrader;
