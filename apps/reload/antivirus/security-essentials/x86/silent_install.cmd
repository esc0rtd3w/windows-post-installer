@echo off


:: Checking network connectivity

setlocal ENABLEDELAYEDEXPANSION

set host=google.com

	ping -n 1 %host% | find "TTL"
	
    if not errorlevel 1 set lanStatus=online
    if errorlevel 1 set lanStatus=offline
	
    if !lanStatus!==online (
	set lanStatus=online
	)
	
    if !lanStatus!==offline (
	set lanStatus=offline
	)
	
)

endlocal

goto start


:start
set installer=none
set appName=Microsoft Security Essentials
set silentSwitch=/s /runwgacheck

cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%

:: Only downloading update if lan variable is set to 1
::if %lanStatus%==online call "%~dp0updates\get_update.cmd"

set installer=none
set appName=Microsoft Security Essentials Definition Update
set silentSwitch=

cls
echo Installing %appName%....

for %%a in (%~dp0updates\*.exe) do set installer=%%a

"%installer%" %silentSwitch%