@echo off
timeout 2
echo.
echo KILL server_2.exe
set serverkill="E:\A2Server"
cd /d %serverkill%
taskkill /f /im server_2.exe
echo.
echo Kill Bec1.exe
set beckill="E:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_2.exe
timeout 2
echo.
echo Kill MBcon
set MBconkill="E:\A2Server\MBcon\server_2"
cd /d %MBconkill%
taskkill /f /im MBcon_2.exe
echo.
timeout 2
echo Kill MBcon Moniter
set MBconMkill="E:\A2Server\MBcon\server_2"
cd /d %MBconMkill%
taskkill /f /im MBCon_2_moniter.cmd
timeout 2
echo.
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"E:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Deleting Old Pbos
del "E:\A2Server\MPMissions\DayZ_GG.Chernarus.pbo"
del "E:\A2Server\@Server_2\addons\*.pbo"
timeout 2
:: start Maintainance
set logpath="C:\Dayz\SQL_SCRIPTS"
cd /d %logpath%
start server_2.bat
echo.
echo Starting Log Rotator
timeout 2
:: start Log Log Rotator
set logpath="E:\A2Server\server_2"
cd /d %logpath%
start rotate_logs.bat
echo.
echo.
timeout 2
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\cherno
copy C:\Dayz\steam_appid.txt E:\A2Server\steam_appid.txt
echo.
timeout 2
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_2 E:\A2Server\server_2
echo.
timeout 2
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "E:\A2Server\@Server_2\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\cherno" "E:\A2Server\MPMissions\DayZ_GG.Chernarus.pbo"
echo.
timeout 2
echo.
echo Moving Files back to root
move C:\Dayz\maps\cherno\GG C:\Dayz\
echo.
echo.
echo Starting Dayz Server
timeout 2
:: start the server..
start /REALTIME "arma2" /min "E:\A2Server\server_2.exe" -port=2322 "-config=server_2\config.cfg" "-cfg=server_2\basic.cfg" "-profiles=server_2" -name=server_2 "-mod=@DayzOverwatch;@DayZ_Epoch;@Server_2;@extDB;" "-BEpath=E:\A2Server\BattlEye" "-malloc=tbb3malloc_bi"  -world=tavi -cpuCount=4 -exThreads=1 -maxmem=2047 -noCB
echo.
echo Starting Bec
timeout 5
:: start bec
set becpath="E:\A2Server\BEC"
cd /d %becpath%
start "" "Bec_2.exe" -f server_2.cfg
echo.
echo Starting Blacklister
timeout 10
:: start Blacklister
set listerpath="E:\A2Server\MBcon\server_2"
cd /d %listerpath%
start "" "MBcon_2_restart.cmd"
echo.
cls
@exit