fnc_con_message = {
	private ["_systemmsg"];
	_systemmsg = _this select 0;
	systemChat _systemmsg;
};
"connectionMessage" addPublicVariableEventHandler {(_this select 1) call fnc_con_message;};