//########################
// Chatzbach Trader by EPD
//########################
//Medic
_unit_1 = objNull;
if (true) then
{
  _bldObj = createAgent ["TK_Commander_EP1_DZ", [7851.9258, 8845.4668, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_1 = _bldObj;
  _bldObj setDir -795.42169;
  _bldObj setUnitAbility 0.60000002;
  _bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _bldObj setUnitAbility 0.60000002;
_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
};

//Building
_unit_2 = objNull;
if (true) then
{
  _bldObj = createAgent ["BAF_Soldier_EN_MTP", [7843.8496, 8837.1563, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_2 = _bldObj;
  _bldObj setDir 1.3727932;
  _bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _bldObj setUnitAbility 0.60000002;
_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
};

//Vehicle
_unit_3 = objNull;
if (true) then
{
  _bldObj = createAgent ["GUE_Commander", [7850.873, 8835.667, -0.014542133], [], 0, "CAN_COLLIDE"];
  _unit_3 = _bldObj;
  _bldObj setDir 138.44409;
  _bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _bldObj setUnitAbility 0.60000002;
_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
};

//Food
_unit_4 = objNull;
if (true) then
{
  _bldObj = createAgent ["Damsel3", [7847.5791, 8859.3828, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _unit_4 = _bldObj;
  _bldObj setDir -159.7012;
  _bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _bldObj setUnitAbility 0.60000002;
_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
};

//Ammunition
_unit_5 = objNull;
if (true) then
{
  _bldObj = createAgent ["GUE_Worker2", [7843.3989, 8860.5684, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
  _unit_5 = _bldObj;
  _bldObj setDir -171.77649;
  _bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _bldObj setUnitAbility 0.60000002;
_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
};

//Weapons
_unit_6 = objNull;
if (true) then
{
  _bldObj = createAgent ["Soldier_MG_PKM_PMC", [7837.5337, 8857.7979], [], 0, "CAN_COLLIDE"];
  _unit_6 = _bldObj;
  _bldObj setDir -251.82944;
  _bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _bldObj setUnitAbility 0.60000002;
_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_0_2000", [7907.0283, 8881.71, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -132.44165;
  _bldObj setPos [7907.0283, 8881.71, -3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_0_2000", [7928.7754, 8923.0322, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -153.44324;
  _bldObj setPos [7928.7754, 8923.0322, -9.1552734e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_6konec", [7856.7632, 8852.0527, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 79.647827;
  _bldObj setPos [7856.7632, 8852.0527, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_Cargo1Bo_military", [7835.4727, 8835.6563, -0.083854109], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 25.271458;
  _bldObj setPos [7835.4727, 8835.6563, -0.083854109];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_cargo_cont_net1", [7841.2437, 8836.4238, -0.028870406], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -78.653664;
  _bldObj setPos [7841.2437, 8836.4238, -0.028870406];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Misc_Cargo1E_EP1", [7829.4165, 8846.5039, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -15.903332;
  _bldObj setPos [7829.4165, 8846.5039, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_Cargo1B_military", [7853.7119, 8839.0273, -0.099913061], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 44.598286;
  _bldObj setPos [7853.7119, 8839.0273, -0.099913061];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Hhedgehog_concreteBig", [7856.9375, 8852.124, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -100.51162;
  _bldObj setPos [7856.9375, 8852.124, -3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7847.6235, 8863.6836, -0.29777947], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -153.7885;
  _bldObj setPos [7847.6235, 8863.6836, -0.29777947];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7857.0449, 8844.4043, -0.15818527], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -72.318977;
  _bldObj setPos [7857.0449, 8844.4043, -0.15818527];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7832.4565, 8862.4326, -0.20436567], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -207.94382;
  _bldObj setPos [7832.4565, 8862.4326, -0.20436567];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_Cargo1B_military", [7846.73, 8834.6572, -0.12743002], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 66.654083;
  _bldObj setPos [7846.73, 8834.6572, -0.12743002];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_Backpackheap", [7845.8516, 8862.4287, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7845.8516, 8862.4287, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["FireBarrel_DZ", [7831.103, 8849.3516, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7831.103, 8849.3516, -3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Campfire_burning", [7848.311, 8850.5146, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7848.311, 8850.5146, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_CncBlock_Stripes", [7853.5254, 8836.8525, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -40.948254;
  _bldObj setPos [7853.5254, 8836.8525, 0.00012207031];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_concrete_High", [7852.54, 8857.0518, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 145.57748;
  _bldObj setPos [7852.54, 8857.0518, 1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Misc_ConcOutlet_EP1", [7849.5967, 8835.1367, 2.7029703], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 59.259636;
  _bldObj setPos [7849.5967, 8835.1367, 2.7029703];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_transport_kiosk_EP1", [7849.1812, 8858.624, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -228.10254;
  _bldObj setPos [7849.1812, 8858.624, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_stand_small_EP1", [7847.2368, 8861.5664, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -146.33923;
  _bldObj setPos [7847.2368, 8861.5664, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Ind_Timbers", [7823.6836, 8847.1992], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 64.881355;
  _bldObj setPos [7823.6836, 8847.1992];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Sr_border", [7853.0044, 8832.75], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 59.264729;
  _bldObj setPos [7853.0044, 8832.75];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7853.9238, 8859.4336, -0.23135647], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -126.65475;
  _bldObj setPos [7853.9238, 8859.4336, -0.23135647];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Ind_BoardsPack1", [7846.3682, 8836.5713, -0.046113964], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -115.4052;
  _bldObj setPos [7846.3682, 8836.5713, -0.046113964];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Barrels", [7843.9941, 8835.8838, -0.00017151074], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -94.166039;
  _bldObj setPos [7843.9941, 8835.8838, -0.00017151074];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_bags_EP1", [7848.543, 8860.7432, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7848.543, 8860.7432, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_MASH", [7851.7363, 8841.8525, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -56.07119;
  _bldObj setPos [7851.7363, 8841.8525, 4.5776367e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_Pristresek_mensi", [7843.4644, 8861.584, -0.037980333], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -180.27167;
  _bldObj setPos [7843.4644, 8861.584, -0.037980333];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Info_Board_EP1", [7854.2412, 8847.542, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 171.63562;
  _bldObj setPos [7854.2412, 8847.542, 3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_CncBlock_Stripes", [7849.0552, 8834.1094, -0.035080072], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -21.222807;
  _bldObj setPos [7849.0552, 8834.1094, -0.035080072];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_CncBlock", [7851.1665, 8835.5586, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -32.347603;
  _bldObj setPos [7851.1665, 8835.5586, 1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Ind_Timbers", [7824.7397, 8839.8496, 0.13383496], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -8.2018995;
  _bldObj setPos [7824.7397, 8839.8496, 0.13383496];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7840.7871, 8834.3838, -0.049576771], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -165.60548;
  _bldObj setPos [7840.7871, 8834.3838, -0.049576771];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7831.3374, 8839.6338, -0.079361111], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -134.51682;
  _bldObj setPos [7831.3374, 8839.6338, -0.079361111];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_Cargo1Bo_military", [7826.0757, 8851.6211, 0.0054199188], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -85.973145;
  _bldObj setPos [7826.0757, 8851.6211, 0.0054199188];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7827.2661, 8846.3418, -0.12623022], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -102.4649;
  _bldObj setPos [7827.2661, 8846.3418, -0.12623022];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7827.4966, 8856.7168, -0.16678628], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -65.325615;
  _bldObj setPos [7827.4966, 8856.7168, -0.16678628];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_HBarrier_large", [7839.8892, 8864.8828, -0.40743017], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -182.51799;
  _bldObj setPos [7839.8892, 8864.8828, -0.40743017];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["FireBarrel_DZ", [7850.4028, 8855.6133, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7850.4028, 8855.6133, 4.5776367e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_t_quercus3s", [7841.8633, 8851.4551, 0.40616027], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -117.98296;
  _bldObj setPos [7841.8633, 8851.4551, 0.40616027];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_t_picea2s", [7876.3203, 8830.418, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7876.3203, 8830.418, 3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_t_picea1s", [7840.9619, 8870.9307, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7840.9619, 8870.9307, 0.00012207031];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_t_picea2s", [7820.3145, 8840.6572, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7820.3145, 8840.6572, 4.5776367e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_t_picea2s", [7832.8403, 8820.043, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7832.8403, 8820.043, 4.5776367e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_t_picea1s", [7856.3618, 8821.8369, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -68.196007;
  _bldObj setPos [7856.3618, 8821.8369, -1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_concrete_High", [7855.2329, 8846.1035, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -71.380188;
  _bldObj setPos [7855.2329, 8846.1035, 6.1035156e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Pile_of_wood", [7837.2661, 8836.6826], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -74.339874;
  _bldObj setPos [7837.2661, 8836.6826];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["AmmoCrates_NoInteractive_Medium", [7837.5444, 8859.0264, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 20.099962;
  _bldObj setPos [7837.5444, 8859.0264, 7.6293945e-006];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["AmmoCrates_NoInteractive_Large", [7836.5811, 8856.3467, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -75.32196;
  _bldObj setPos [7836.5811, 8856.3467, -3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["CDF_WarfareBAircraftFactory", [7829.998, 8859.6309, -0.92265785], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -252.38995;
  _bldObj setPos [7829.998, 8859.6309, -0.92265785];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_22_50", [7880.8164, 8860.082, -9.9182129e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -122.09481;
  _bldObj setPos [7880.8164, 8860.082, -9.9182129e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_30_25", [7913.9131, 8892.1455, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -161.04765;
  _bldObj setPos [7913.9131, 8892.1455, 3.8146973e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_10_100", [7894.4448, 8870.1777, -9.5367432e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -131.95851;
  _bldObj setPos [7894.4448, 8870.1777, -9.5367432e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_10_100", [7913.9199, 8891.9805, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 19.578188;
  _bldObj setPos [7913.9199, 8891.9805, -5.7220459e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_0_2000", [7928.5815, 8922.6973, 0.00040435791], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 25.486027;
  _bldObj setPos [7928.5815, 8922.6973, 0.00040435791];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_10_100", [7935.8384, 8937.7842, 0.00032043457], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 23.769884;
  _bldObj setPos [7935.8384, 8937.7842, 0.00032043457];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_0_2000", [7954.1875, 8967.043, 5.1498413e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -144.78745;
  _bldObj setPos [7954.1875, 8967.043, 5.1498413e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_30_25", [7957.3408, 8977.6162, 0.0001449585], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -175.5966;
  _bldObj setPos [7957.3408, 8977.6162, 0.0001449585];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["MAP_grav_6konec", [7957.8799, 8983.5859, -7.2479248e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -175.27933;
  _bldObj setPos [7957.8799, 8983.5859, -7.2479248e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["HeliHEmpty", [7855.7754, 8831.2627, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir 36.104389;
  _bldObj setPos [7854.7729, 8830.2344, 1.5258789e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_cargo_cont_net1", [7833.0879, 8843.4697, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -113.13648;
  _bldObj setPos [7833.0879, 8843.4697, 3.0517578e-005];
};

_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Misc_cargo_cont_net1", [7831.46, 8847.1719, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _bldObj = _bldObj;
  _bldObj setDir -110.12751;
  _bldObj setPos [7831.46, 8847.1719, 4.5776367e-005];
};

processInitCommands;