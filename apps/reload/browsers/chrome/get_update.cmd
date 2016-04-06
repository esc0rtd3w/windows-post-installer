@echo off

:: Gets current running directory of batch file
set runPath=%~dp0

set tempPath=%temp%
set savePath=%runPath%
::set linkPath=https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B0683301B-07D1-FC29-011C-591712DA149B%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue/update2/installers/ChromeStandaloneSetup.exe
set linkPath=http://www.google.com/chrome/eula.html?system=true&standalone=1

::set useragent=--user-agent="Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0"

:: Used for T-Mobile tethering bypass
set useragent=--user-agent="Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/31.0"
set header=--header="Accept: text/html"

set nocert=--no-check-certificate

set updateFile=ChromeStandaloneSetup.exe


:: Get update exe name
::cd updates
::for %%a in (*.exe) do set updateFile=%%a
::cd ..


:getRootDrive

for /l %%a in (1,1,10) do (
    pushd ..
)

set root=%cd%
popd
::echo root: %root%

set wget="%root%_ISO\bin\wget.exe"


::%wget% -O "%tempPath%\%updateFile%" %linkPath%
%wget% %nocert% %useragent% -O "%tempPath%\%updateFile%" %linkPath%

pause
echo Copying New Update to Portable Media....
echo.

xcopy "%tempPath%\%updateFile%" "%savePath%" /q /r /y

::pause


:end


