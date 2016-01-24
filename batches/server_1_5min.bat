@ECHO OFF
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure ([Y]/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
echo.
echo Kill Bec1.exe
set beckill="D:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_1.exe
timeout 2
echo
echo Starting 5 Minute Bec
timeout 2
:: start bec
set becpath="D:\A2Server\BEC"
cd /d %becpath%
start "Battleye Extended Controls" /min "Bec_1.exe" -f server_1_5min.cfg
echo.
:END
endlocal