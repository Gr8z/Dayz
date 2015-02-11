if (isServer) then {
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13225.278, 3431.5159, -6.0489159], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13225.278, 3431.5159, -6.0489159];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13247.008, 3398.5906, -6.1535072], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13247.008, 3398.5906, -6.1535072];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_1", [13203.401, 3464.7751, -6.2994447], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 236.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13203.401, 3464.7751, -6.2994447];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13181.671, 3497.7451, -6.1785541], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setPos [13181.671, 3497.7451, -6.1785541];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13159.978, 3530.6299, -6.3031154], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setPos [13159.978, 3530.6299, -6.3031154];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13138.261, 3563.5496, -5.9914126], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setPos [13138.261, 3563.5496, -5.9914126];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13116.587, 3596.4583, -6.1611514], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setPos [13116.587, 3596.4583, -6.1611514];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13094.851, 3629.364, -6.0637994], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setPos [13094.851, 3629.364, -6.0637994];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_1", [13073.158, 3662.2742, -6.1899328], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13073.158, 3662.2742, -6.1899328];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13051.535, 3695.0833, -6.376471], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13051.535, 3695.0833, -6.376471];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13029.813, 3728.052, -6.1521502], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13029.813, 3728.052, -6.1521502];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
// Control Tower near land (non-lootable) (blinking light).  Zombies and loot will not spawn over water.
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Mil_ControlTower_EP1", [13067.721, 3647.5923, 4.2818656], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -303.12695;
  _bldObj setPos [13067.721, 3647.5923, 4.2818656];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, 3.8];
};
 
// Cement block under Control Tower near coast
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_c", [13061.675, 3654.853, 0.13833603], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -33.287552;
  _bldObj setPos [13061.675, 3654.853, 0.13833603];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
// Grocery on land (lootable)
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_A_GeneralStore_01", [13062.828, 3825.6414, 0.34161228], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -32.551853;
  _bldObj setPos [13062.828, 3825.6414, 0.34161228];
};
 
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_m_2", [13260.079, 3378.8081, -3.0727394], [], 0, "CAN_COLLIDE"];
  _bldObj setDir 56.571701;
  _bldObj setVehicleLock "LOCKED";
  _bldObj setPos [13260.079, 3378.8081, -3.0727394];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
// Industrial Hangar on land
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Hangar_2", [13013.877, 3793.1804, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -33.153507;
  _bldObj setPos [13013.877, 3793.1804, 3.8146973e-006];
};
 
// Control Tower near Island (non-lootable) (blinking light at night).  Zombies and loot will not spawn over water.
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Mil_ControlTower_EP1", [13209.424, 3478.5696, 2.103996], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -484.14117;
  _bldObj setPos [13209.424, 3478.5696, 2.103996];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, 3.8];
};
 
// Cement block under Control Tower near Island
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["land_nav_pier_c", [13214.373, 3472.0823, -3.8479133], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -213.288;
  _bldObj setPos [13214.373, 3472.0823, -3.8479133];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, -2.5];
};
 
// Spinning Radar on coast
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["TK_GUE_WarfareBAntiAirRadar_Base_EP1", [13293.171, 3955.2397, 0.016692447], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -323.84015;
  _bldObj setPos [13293.171, 3955.2397, 0.016692447];
};
 
// Pallet of boards on bridge (mid way protection)
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Ind_BoardsPack1", [13158.683, 3537.4517, 3.5], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -35.139294;
  _bldObj setPos [13158.683, 3537.4517, 3.5];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, 3.5];
};
 
// Pallet of boards on bridge (mid way protection)
_bldObj = objNull;
if (true) then
{
  _bldObj = createVehicle ["Land_Ind_BoardsPack1", [13111.459, 3599.3118, 3.5], [], 0, "CAN_COLLIDE"];
  _bldObj setDir -215.18845;
  _bldObj setPos [13111.459, 3599.3118, 3.5];
  _bldObj setPosASL [getposASL _bldObj select 0, getposASL _bldObj select 1, 3.5];
};
 
};