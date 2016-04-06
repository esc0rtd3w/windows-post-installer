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
echo Choose a category and press ENTER:
echo.
echo.
echo 1. Antivirus
echo.
echo 2. Browsers
echo.
echo 3. Multimedia
echo.
echo 4. PDF Readers
echo.
echo 5. Redistributables
echo.
echo 6. Social
echo.
echo B) Back To Main Menu
echo.
echo.

set /p categoryTemp=

if %categoryTemp% gtr 6 goto menuMain

if %tweakTemp%==b goto end
if %tweakTemp%==B goto end

if %categoryTemp%==1 set category=antivirus
if %categoryTemp%==2 set category=browsers
if %categoryTemp%==3 set category=multimedia
if %categoryTemp%==4 set category=pdfreaders
if %categoryTemp%==5 set category=redist
if %categoryTemp%==6 set category=social

goto %category%



:antivirus
cls
echo Choose an app and press ENTER:
echo.
echo.
echo 1. 
echo.
echo.

set /p appActiveTemp=


if %categoryTemp% gtr 1 goto antivirus

if %appActiveTemp%==1 set appActive=


goto menuMain



:browsers
cls
echo Choose an app and press ENTER:
echo.
echo.
echo 1. 
echo.
echo.

set /p appActiveTemp=


if %categoryTemp% gtr 1 goto browsers

if %appActiveTemp%==1 set appActive=


goto menuMain


:multimedia
cls
echo Choose an app and press ENTER:
echo.
echo.
echo 1. 
echo.
echo.

set /p appActiveTemp=


if %categoryTemp% gtr 1 goto multimedia

if %appActiveTemp%==1 set appActive=


goto menuMain



:pdfreaders
cls
echo Choose an app and press ENTER:
echo.
echo.
echo 1. 
echo.
echo.

set /p appActiveTemp=


if %appActiveTemp%==1 set appActive=


goto menuMain


:redist
cls
echo Choose an app and press ENTER:
echo.
echo.
echo 1. 
echo.
echo.

set /p appActiveTemp=


if %categoryTemp% gtr 1 goto redist

if %appActiveTemp%==1 set appActive=


goto menuMain


:social
cls
echo Choose an app and press ENTER:
echo.
echo.
echo 1. 
echo.
echo.

set /p appActiveTemp=


if %categoryTemp% gtr 1 goto social

if %appActiveTemp%==1 set appActive=


goto menuMain


call "apps\reload\browsers\chrome\silent_install.cmd"



:end




