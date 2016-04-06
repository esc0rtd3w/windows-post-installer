@echo off


:init

mode con lines=29

title Multi Installer - Main Menu

set root=%~dp0

::echo %root%
::pause


set wget="%root%_ISO\bin\wget.exe"

set nircmd="%root%_ISO\bin\nircmd.exe"
set sendKey="%root%_ISO\bin\nircmd.exe" sendkey

set sendKeyEnter="%root%_ISO\bin\nircmd.exe" sendkey 0x0d press
set sendKeyTab="%root%_ISO\bin\nircmd.exe" sendkey 0x09 press
set sendKeyLeft="%root%_ISO\bin\nircmd.exe" sendkey 0x25 press
set sendKeyRight="%root%_ISO\bin\nircmd.exe" sendkey 0x27 press
set sendKeyUp="%root%_ISO\bin\nircmd.exe" sendkey 0x26 press
set sendKeyDown="%root%_ISO\bin\nircmd.exe" sendkey 0x28 press

set setres="%root%_ISO\bin\nircmd.exe" setdisplay 1024 768 24 90 -updatereg -allusers

set choice="%root%_ISO\bin\choice.exe"
set cocolor="%root%_ISO\bin\cocolor.exe"


:: Timers
set timerCount=
set timerCount2=1000

::set wasteTime=for /l %%a in (0,1,%timerCount2%) do echo nothing > nul
set wasteTime="%root%_ISO\bin\nircmd.exe" wait 2000



:checkbits
set bits=x86
if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64

goto checkos


:checkos

:: Check Operating System

:: Set Default OS
set ostype=windows

:: Check common OS versions
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


set nircmd="%root%_ISO\bin\nircmd.exe"


:: Checking if executed in a PE environment

if not [%ostype%]==[] goto start


:peload

::cls
::echo peload
::pause

for %%i in (C D E F G H I J K L N M O P Q R S T U V W X Y Z) do if exist %%i:\_ISO\e2b\firadisk\loadiso.cmd  cmd /k %%i:\_ISO\e2b\firadisk\loadiso.cmd
call %%i:\_ISO\e2b\firadisk\loadiso.cmd"

goto end




:start

::cls
::echo start
::pause

::%setres%


set lan=0
ping google.com | find "Reply from" >nul
if errorlevel 0 set lan=1
::echo %lan%
::pause



:: UAC Stuff
:: XP Fix
set uacStatus=none

::if %ostype%==vista goto checkuac
::if %ostype%==win7 goto checkuac
::if %ostype%==win8 goto checkuac
::if %ostype%==win81 goto checkuac

if %ostype%==vista call "checkuac.cmd"
if %ostype%==win7 call "checkuac.cmd"
if %ostype%==win8 call "checkuac.cmd"
if %ostype%==win81 call "checkuac.cmd"
if %ostype%==win10 call "checkuac.cmd"



:menu
cls
if %uacStatus%==Enabled %cocolor% 0a
if %uacStatus%==Disabled %cocolor% 0c
echo UAC Status: %uacStatus%
echo.
%cocolor% 0e
echo Detected Operating System: %ostype% %bits%
%cocolor% 0f
echo.
echo Select an action and press ENTER:
echo.
echo.
echo 1) Install Common Applications
echo.
echo 2) Install Device Drivers*
echo.
echo 3) Custom Setup and Tweaks*
echo.
echo 4) Open Applications Menu*
echo.
echo 5) Launch Portable Cleaning Lab*
echo.
echo 6) Restart Explorer Shell
echo.
echo 7) Restart Computer
echo.
echo 8) Shut Down Computer
echo.
echo.
echo X) Exit
echo.

choice /c 12345678x /n

if errorlevel 9 exit
if errorlevel 8 set actionMenuNav=%root%shutdown.cmd
if errorlevel 7 set actionMenuNav=%root%reboot.cmd
if errorlevel 6 set actionMenuNav=%root%restart_explorer.cmd
if errorlevel 5 goto pcl
if errorlevel 4 set actionMenuNav=%root%_ISO\scripts\app_launch.cmd
if errorlevel 3 set actionMenuNav=%root%tweaks\menu.cmd
::if errorlevel 2 set actionMenuNav=%root%reload_other.cmd
::if errorlevel 2 set actionMenuNav=%root%drivers\menu.cmd
if errorlevel 2 goto drivers
if errorlevel 1 set actionMenuNav=%root%reload_common.cmd

%actionMenuNav%

goto menu


:drivers

call "drivers\mount_iso.cmd"

goto end



:pcl

start cmd /k "%~dp0pcl\portable-cleaning-lab.cmd"

goto menu




:end

