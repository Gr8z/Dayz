private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Fiberplant",[1, 1],312.852,1,0,{}],
	["Fiberplant",[6, 6],312.852,1,0,{}],
	["Fiberplant",[11, 11],312.852,1,0,{}],
	["Fiberplant",[17, 17],312.852,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;
