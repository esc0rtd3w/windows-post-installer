@echo off

title Reload Common Applications

:: Timers
set wait120=ping 127.0.0.1 -n 120 >nul


:checkbits
set bits=x86
if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64

goto checkos


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



:menuMain
cls
echo Choose an option and press ENTER:
echo.
echo.
echo 1. 
echo.
echo 2. 
echo.
echo 3. 
echo.
echo 4. 
echo.
echo 5. 
echo.
echo 6. 
echo.
echo B) Back To Main Menu
echo.
echo.

set /p tweakTemp=

if %tweakTemp% gtr 6 goto menuMain

if %tweakTemp%==b goto end
if %tweakTemp%==B goto end

if %tweakTemp%==1 set tweak=antivirus
if %tweakTemp%==2 set tweak=browsers
if %tweakTemp%==3 set tweak=multimedia
if %tweakTemp%==4 set tweak=pdfreaders
if %tweakTemp%==5 set tweak=redist
if %tweakTemp%==6 set tweak=social

goto %app%







:end




