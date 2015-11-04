@echo off
@REM *** PARAMETERS/VARIABLES ***
SET mysqlschema=dayz
SET mysqlpassword=Database00
SET mysqluser=root
@REM *** EXECUTION ***

echo.
echo.
echo RUNNING SQL Cleanup Script...
echo.
echo.
E:\MySQL\bin\mysql.exe -u %mysqluser% -p%mysqlpassword% %mysqlschema%  < "C:\Dayz\SQL_SCRIPTS\server_3.sql"
exit