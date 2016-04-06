@echo off

:: This is used to skip ping test if the %lan% variable has already been set from main menu.
if defined lan goto start

:: Checking network connectivity
set lan=0
ping google.com | find "Reply from" >nul
if errorlevel 0 set lan=1

:start
set installer=none
set appName=Microsoft Security Essentials
set silentSwitch=/s /runwgacheck

cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%

:: Only downloading update if lan variable is set to 1
if %lan%==1 call "%~dp0updates\get_update.cmd"

set installer=none
set appName=Microsoft Security Essentials Definition Update
set silentSwitch=

cls
echo Installing %appName%....

for %%a in (%~dp0updates\*.exe) do set installer=%%a

"%installer%" %silentSwitch%