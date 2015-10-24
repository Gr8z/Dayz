if (!isServer) exitWith {};
_args = _this select 0;
_victim = _args select 0;
_killer = _args select 1;

_vicHumanity = _victim getVariable ["humanity",0];
_kilHumanity = _killer getVariable ["humanity",0];
_vicName = _victim getVariable["bodyName","unknown"];
_kilName = _killer getVariable["bodyName","unknown"];
_kilBandits = _killer getVariable ["banditKills",0];
_kilHumans = _killer getVariable ["humanKills",0];
humChange = 0;

if(_killer isKindOf "Man" and _kilName != "unknown") then{
	if(_kilHumanity < -5000) then {
		if(_vicHumanity < -5000) then {
			humChange = +100;
			_killer setVariable ["banditKills",(_kilBandits + 1),true];
		} else {
			if(_vicHumanity > 5000) then {
				humChange = -1000;
			} else {
				if(_vicHumanity >= 2500) then{
					humChange = -750;
				} else {
					humChange = -500;
				};
			};
			_killer setVariable ["humanKills",(_kilHumans + 1),true];
		};
	} else {
		if(_kilHumanity < 2500) then {
			if(_vicHumanity < -5000) then {
				humChange = +150;
				_killer setVariable ["banditKills",(_kilBandits + 1),true];
			} else {
				if(_vicHumanity > 5000) then {
					humChange = -1000;
				} else {
					if(_vicHumanity >= 2500) then{
						humChange = -750;
					} else {
						humChange = -500;
					};
				};
				_killer setVariable ["humanKills",(_kilHumans + 1),true];
			};
		} else {
			if(_kilHumanity < 5000) then {
				if(_vicHumanity < -5000) then {
					humChange = +200;
					_killer setVariable ["banditKills",(_kilBandits + 1),true];
				} else {
					if(_vicHumanity > 5000) then {
						humChange = -1000;
					} else {
						if(_vicHumanity >= 2500) then{
							humChange = -750;
						} else {
							humChange = -500;
						};
					};
					_killer setVariable ["humanKills",(_kilHumans + 1),true];
				};
			} else {
				if(_vicHumanity < -5000) then {
					humChange = +350;
					_killer setVariable ["banditKills",(_kilBandits + 1),true];
				} else {
					if(_vicHumanity > 5000) then {
						humChange = -1000;
					} else {
						if(_vicHumanity >= 2500) then{
							humChange = -750;
						} else {
							humChange = -500;
						};
					};
					_killer setVariable ["humanKills",(_kilHumans + 1),true];
				};
			};
		};
	};
	_killer setVariable["humanity",_kilHumanity+humChange,true];
	humChange = nil;
};
ctc_HumanityChange = nil;