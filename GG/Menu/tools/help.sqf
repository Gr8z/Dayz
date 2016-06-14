/**HELP CMD**/
_CC_HTXT 	=			//Dynamic text that will be sent when a player types !HELP
[
"<t color='#0000FF'size='1.5'>Help menu</t><br/>",
"Type...<br/>",
"<t color='#848484'>!help</t> to see this list.<br/>",
"<t color='#848484'>!nohud</t> to toggle the HUD.<br/>",
"<t color='#848484'>!pm</t> to send a private message to a player.<br/>",
"<t color='#848484'>!re</t> to send a private message to the last person to PM you or that you PMed.<br/>",
"<t color='#848484'>!ts3</t> to get our teamspeak IP.<br/>",
"<t color='#848484'>!rules</t> to see the server rules.<br/>",
"<t color='#848484'>!intro</t> to view the server intro.<br/>",
"<t color='#848484'>!online</t> to see all online players.<br/>",
"<t color='#848484'>!kill</t> to suicide.<br/>",
"<t color='#848484'>!viewdistance</t> to set your view distance (between <t color='#848484'>100</t> and <t color='#848484'>10000</t>).<br/>",
"<t color='#848484'>!nograss</t> to toggle grass on/off.<br/>",
"<t color='#848484'>!airdrop</t> to call an airdrop.<br/>",
"<t color='#848484'>!scan</t> to scan nearby players.<br/>",
"<t color='#848484'>!stop</t> to stop all animations.<br/>",
"<t color='#848484'>Press Y</t> to toggle earplugs.<br/>",
"<t color='#848484'>Press Right Alt Key</t> to open action Menu.<br/>",
"<t color='#848484'>Press Right Shift Key</t> to open group manager.<br/>",
"<t color='#848484'>Press Windows Key</t> to toggle group icons for your group.<br/>",
"ANIMATIONS:<br/>",
"<t color='#848484'>!dance1</t>, <t color='#848484'>!dance2</t>, <t color='#848484'>!dance3</t>, <t color='#848484'>!boxing</t>, <t color='#848484'>!handstand</t>, <t color='#848484'>!laydown</t>, <t color='#848484'>!situps</t>, <t color='#848484'>!pushups</t><br/>",
"<t size='1'>Type <t color='#0000FF'>!help</t> to hide this menu.</t><br/>"
];

if (isNil 'help_on') then {
	help_on = true;
	_txt = '';
	{_txt = (_txt + _x)} forEach _CC_HTXT;
	["<t size='0.5'align='left'>"+_txt+"</t>",0.1 * safezoneW + safezoneX,0.1 * safezoneH + safezoneY,120,0,0,77398] spawn AH_fnc_dynamictext
} else {
	help_on = nil;
	[' ',0,0,1,0,0,77398] spawn AH_fnc_dynamictext
};