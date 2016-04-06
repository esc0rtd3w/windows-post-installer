@echo off

:checkbits
set bits=x86
if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64


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


set installer=none
set appName=Visual C++ 2012 Redistributable
set silentSwitch=/quiet /repair /norestart



cls
echo Installing %appName%....

for %%a in (%~dp0vcredist_x86.exe) do set installer=%%a
"%installer%" %silentSwitch%

if %bits%==x86 goto end



cls
echo Installing %appName%....

for %%a in (%~dp0vcredist_x64.exe) do set installer=%%a
"%installer%" %silentSwitch%



:end


