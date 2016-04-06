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


set installer=none
set appName=Microsoft.NET Framework
set silentSwitch=/q /norestart / passive


:xp
cls
echo Installing %appName%....

:: XP only supports up to v4.0 of .NET Framework
for %%a in (%~dp0dotnetfx40.exe) do set installer=%%a

if %ostype%==xp "%installer%" %silentSwitch%

:: Windows Vista and higher support newest .NET versions
if %ostype%==vista goto vista
if %ostype%==win7 goto vista
if %ostype%==win8 goto vista
if %ostype%==win81 goto vista

::goto end
goto vista


:vista
cls
echo Installing %appName%....

for %%a in (%~dp0dotnetfx451.exe) do set installer=%%a

"%installer%" %silentSwitch%


:end


