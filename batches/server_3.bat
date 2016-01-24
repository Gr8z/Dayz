@echo off
timeout 2
echo.
echo KILL server_3.exe
set serverkill="D:\A2Server"
cd /d %serverkill%
taskkill /f /im server_3.exe
echo.
echo Kill Bec1.exe
set beckill="D:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_3.exe
echo.
echo Kill EPM_3.exe
set EPMkill="D:\A2Server\EPM"
cd /d %EPMkill%
taskkill /f /im EPM_3.exe
timeout 2
echo.
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"D:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Deleting Old Pbos
del "D:\A2Server\MPMissions\DayZ_GG.Napf.pbo"
del "D:\A2Server\@Server_3\addons\*.pbo"
echo Starting Log Rotator
timeout 2
:: start Log Log Rotator
set logpath="D:\A2Server\server_3"
cd /d %logpath%
start /min rotate_logs.bat
echo.
timeout 2
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\napf
copy C:\Dayz\steam_appid.txt D:\A2Server\steam_appid.txt
echo.
timeout 2
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_3 D:\A2Server\server_3
echo.
timeout 2
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "D:\A2Server\@Server_3\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\napf" "D:\A2Server\MPMissions\DayZ_GG.Napf.pbo"
echo.
timeout 2
echo.
echo Moving Files back to root
move C:\Dayz\maps\napf\GG C:\Dayz\
echo.
timeout 2
:: start Maintainance
set Maintainancepath="C:\Dayz\SQL_SCRIPTS"
cd /d %Maintainancepath%
start server_3.bat
echo.
echo Starting Dayz Server
timeout 2
:: start the server..
start /REALTIME "arma2" /realtime /min "D:\A2Server\server_3.exe" -ip=74.91.127.244 -port=2342 "-config=server_3\config.cfg" "-cfg=server_3\basic.cfg" "-profiles=server_3" -name=server_3 "-mod=@DayzOverwatch;@DayZ_Epoch;@server_3;@extDB;@marma_3" "-BEpath=D:\A2Server\BattlEye"
echo.
echo Starting Bec
timeout 5
:: start bec
set becpath="D:\A2Server\BEC"
cd /d %becpath%
start "Battleye Extended Controls" /min "Bec_3.exe" -f server_3.cfg
echo.
echo Starting MBCon
timeout 5
:: start MBCon
set MBconpath="D:\A2Server\MBcon\server_3"
cd /d %MBconpath%
start "MBCon" /min MBcon_3.exe
echo Starting EPM
timeout 5
:: start EPM
set EPMpath="D:\A2Server\EPM"
cd /d %EPMpath%
start "EPM" /min EPM_3.exe -ip=74.91.127.220 -password=GG1029 -port=2342
echo.