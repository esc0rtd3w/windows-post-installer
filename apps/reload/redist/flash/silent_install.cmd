@echo off

:checkos

ver | find "5.1"
if %errorlevel%==0 set ostype=xp

ver | find "6.0"
if %errorlevel%==0 set ostype=vista

ver | find "6.1"
if %errorlevel%==0 set ostype=win7

ver | find "6.2"
if %errorlevel%==0 set ostype=win8

ver | find "6.3"
if %errorlevel%==0 set ostype=win81

ver | find "6.4"
if %errorlevel%==0 set ostype=win10

:: This is the new versioning for Windows 10 (Started sometime in 2015/2016)
ver | find "10."
if %errorlevel%==0 set ostype=win10
ver | find "10.0"
if %errorlevel%==0 set ostype=win10
ver | find "10.1"
if %errorlevel%==0 set ostype=win10
ver | find "10.2"
if %errorlevel%==0 set ostype=win10
ver | find "10.3"
if %errorlevel%==0 set ostype=win10
ver | find "10.4"
if %errorlevel%==0 set ostype=win10
ver | find "10.5"
if %errorlevel%==0 set ostype=win10
ver | find "10.6"
if %errorlevel%==0 set ostype=win10
ver | find "10.7"
if %errorlevel%==0 set ostype=win10
ver | find "10.8"
if %errorlevel%==0 set ostype=win10
ver | find "10.9"
if %errorlevel%==0 set ostype=win10


set installer=none
set appName=Adobe Flash
set silentSwitch=-install


:activex
cls
echo Installing %appName%....

for %%a in (%~dp0*active_x.exe) do set installer=%%a

:: Windows 8/IE10+ does not need the active-x flash installed
if %ostype%==xp "%installer%" %silentSwitch%
if %ostype%==vista "%installer%" %silentSwitch%
if %ostype%==win7 "%installer%" %silentSwitch%
if %ostype%==win8 goto plugin
if %ostype%==win81 goto plugin
if %ostype%==win10 goto plugin


:plugin
cls
echo Installing %appName%....

for %%a in (%~dp0*plugin.exe) do set installer=%%a

"%installer%" %silentSwitch%