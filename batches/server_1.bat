@ECHO OFF
timeout 2
echo.
echo KILL server_1.exe
set serverkill="E:\A2Server"
cd /d %serverkill%
taskkill /f /im server_1.exe
echo.
echo Kill Bec1.exe
set beckill="E:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_1.exe
timeout 2
echo.
echo Kill MBcon
set MBconkill="E:\A2Server\MBcon\server_1"
cd /d %MBconkill%
taskkill /f /im MBcon_1.exe
echo.
timeout 2
echo Kill MBcon Moniter
set MBconMkill="E:\A2Server\MBcon\server_1"
cd /d %MBconMkill%
taskkill /f /im MBCon_1_moniter.cmd
timeout 2
echo
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"E:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Deleting Old Pbos
del "E:\A2Server\MPMissions\DayZ_GG.Tavi.pbo"
del "E:\A2Server\@Server_1\addons\*.pbo"
timeout 2
:: start Maintainance
set logpath="C:\Dayz\SQL_SCRIPTS"
cd /d %logpath%
start server_1.bat
echo.
echo Starting Log Rotator
timeout 2
:: start Log Log Rotator
set logpath="E:\A2Server\server_1"
cd /d %logpath%
start rotate_logs.bat
echo.
echo.
timeout 2
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\tavi
copy C:\Dayz\steam_appid.txt E:\A2Server\steam_appid.txt
echo.
timeout 2
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_1 E:\A2Server\server_1
echo.
timeout 2
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "E:\A2Server\@Server_1\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\tavi" "E:\A2Server\MPMissions\DayZ_GG.Tavi.pbo"
echo.
timeout 2
echo.
echo Moving Files back to root
move C:\Dayz\maps\tavi\GG C:\Dayz\
echo.
echo Starting Dayz Server
timeout 2
:: start the server..
start /REALTIME "arma2" /min "E:\A2Server\server_1.exe" "-port=3302" "-config=server_1\config.cfg" "-cfg=server_1\basic.cfg" "-profiles=server_1" "-name=server_1" "-mod=@Taviana;@DayzOverwatch;@DayZ_Epoch;@Server_1;@extDB;" "-BEpath=E:\A2Server\BattlEye" "-malloc=tbb3malloc_bi" -world=tavi -cpuCount=4 -exThreads=1 -maxmem=2047 -noCB
echo.
echo Starting Bec
timeout 5
:: start bec
set becpath="E:\A2Server\BEC"
cd /d %becpath%
start "" "Bec_1.exe" -f server_1.cfg
echo.
echo Starting Blacklister
timeout 10
:: start Blacklister
set listerpath="E:\A2Server\MBcon\server_1"
cd /d %listerpath%
start "" "MBcon_1_restart.cmd"
echo.
cls
@exit