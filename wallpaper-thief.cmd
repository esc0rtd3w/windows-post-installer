@echo off

color 0b


set cocolor="%~dp0bin\cocolor.exe"


:: Setting find commands
set listFiles=dir /b
set findWallpaper=find "exe"
set pathTemp=%temp%
set results=%temp%\wpFindResults.txt
set openText="%windir%\notepad.exe"


if not exist %pathTemp% md %pathTemp%

set target=%windir%\Web\Wallpaper

::%listFiles% %target% | %findWallpaper%>%results%
%listFiles% "%target%">%results%
::start "" %openText% "%results%"

set dest=%~dp0wallpaper-dump\%username%

if not exist %dest% md %dest%

setlocal ENABLEDELAYEDEXPANSION

set wpList=0
for /f "tokens=*" %%a in (%results%) do (
    set /a wpList=!wpList! + 1
	xcopy /y /e /s /r /i "%target%\%%a\*" "%dest%\%%a"
	xcopy /y /e /s /r "%target%\*" "%dest%"
    if exist "%dest%\%%a" goto end
)


endlocal

:end

explorer "%dest%"





