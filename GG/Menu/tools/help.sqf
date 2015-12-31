/**HELP CMD**/
_CC_HTXT 	=			//Dynamic text that will be sent when a player types !HELP
[
	"<t color='#f00000'size='1.5'>Help menu</t><br/>",
	"Type <t color='#D42436'>!help</t> to see this list.<br/>",
	"Type <t color='#D42436'>!nohud</t> to toggle the HUD.<br/>",
	"Type <t color='#D42436'>!pm</t> to send a private message to a player.<br/>",
	"Type <t color='#D42436'>!re</t> to send a private message to the last person to PM you or that you PMed.<br/>",
	"Type <t color='#D42436'>!ts3</t> to get our teamspeak IP.<br/>",
	"Type <t color='#D42436'>!rules</t> to see the server rules.<br/>",
	"Type <t color='#D42436'>!intro</t> to view the server intro.<br/>",
	"Type <t color='#D42436'>!online</t> to see all online players.<br/>",
	"Type <t color='#D42436'>!kill</t> to suicide.<br/>",
	"Type <t color='#D42436'>Press Y</t> to toggle earplugs.<br/>",
	"Type <t color='#D42436'>!viewdistance</t> to set your view distance (between <t color='#D42436'>100</t> and <t color='#D42436'>10000</t>).<br/>",
	"Type <t color='#D42436'>!nograss</t> to toggle grass on/off.<br/>",
	"Type <t color='#D42436'>!airdrop</t> to call an airdrop.<br/>",
	"Type <t color='#D42436'>!scan</t> to scan nearby players.<br/>",
	"Type <t color='#D42436'>!stop</t> to stop all animations.<br/>",
	"Type <t color='#D42436'>Right Alt Key</t> to open action Menu.<br/>",
	"Type <t color='#D42436'>Right Shift Key</t> to open group manager.<br/>",
	"Type <t color='#D42436'>Windows Key</t> to toggle group tags for your group.<br/>",
	"ANIMATIONS:<br/>",
	"<t color='#D42436'>!dance1</t>, <t color='#D42436'>!dance2</t>, <t color='#D42436'>!dance3</t>, <t color='#D42436'>!boxing</t>, <t color='#D42436'>!handstand</t>, <t color='#D42436'>!laydown</t>, <t color='#D42436'>!situps</t>, <t color='#D42436'>!pushups</t><br/>",
	"<t size='1'>Type <t color='#f00000'>!help</t> to hide this menu.</t><br/>"
];

_txt = '';
{_txt = (_txt + _x)} forEach _CC_HTXT;
[""<t size='0.5'align='left'>""+_txt+""</t>"",0.1 * safezoneW + safezoneX,0.1 * safezoneH + safezoneY,120,0,0,77398] spawn AH_fnc_dynamictext