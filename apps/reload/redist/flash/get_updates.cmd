@echo off

:: Gets current running directory of batch file
set runPath=%~dp0

set tempPath=%temp%
set savePath=%runPath%

set linkPathBase=http://download.macromedia.com/get/flashplayer/current/licensing/win
set linkNameBase=install_flash_player_

set currentVersion=21

set linkNamePluginIE=_active_x.exe
set linkNamePluginOther=_plugin.exe


set wget="%root%_ISO\bin\wget.exe"
set useragent=--user-agent="Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0"
set header=--header="Accept: text/html"

set pluginFailIE=0
set pluginFailOther=0

:getRootDrive

for /l %%a in (1,1,10) do (
    pushd ..
)

set root=%cd%
popd
::echo root: %root%


:start
color 0e
if %pluginFailIE%==1 (
color 0c
del /f /q "%tempPath%\%linkNameBase%%currentVersion%%linkNamePluginIE%"
del /f /q "%tempPath%\%linkNameBase%%currentVersion%%linkNamePluginOther%"
)
if %pluginFailOther%==1 color 0c
cls
echo Enter version number to download and press ENTER:
echo.
echo Current Version Selected: %currentVersion%
echo.
echo.

set /p currentVersion=

:: Get plugin (IE)
%wget% %useragent% -O "%tempPath%\%linkNameBase%%currentVersion%%linkNamePluginIE%" %linkPathBase%/%linkNameBase%%currentVersion%%linkNamePluginIE%

set /a pluginFailIE=%errorlevel%

if %pluginFailIE%==1 goto start

:: Get Plugin (Other Browsers)
%wget% %useragent% -O "%tempPath%\%linkNameBase%%currentVersion%%linkNamePluginOther%" %linkPathBase%/%linkNameBase%%currentVersion%%linkNamePluginOther%

set /a pluginFailOther=%errorlevel%

if %pluginFailOther%==1 goto start


echo Copying New Updates to Portable Media....
echo.

copy /y "%tempPath%\%linkNameBase%%currentVersion%%linkNamePluginIE%" "%savePath%%linkNameBase%%currentVersion%%linkNamePluginIE%"
copy /y "%tempPath%\%linkNameBase%%currentVersion%%linkNamePluginOther%" "%savePath%%linkNameBase%%currentVersion%%linkNamePluginOther%"

::pause


:end


