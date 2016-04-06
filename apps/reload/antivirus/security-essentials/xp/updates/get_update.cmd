@echo off

:: Gets current running directory of batch file
set runPath=%~dp0

set tempPath=%temp%
set savePath=%runPath%
set linkPath=http://go.microsoft.com/fwlink/?LinkID=87342
::set linkpath=http://www.microsoft.com/security/encyclopedia/adlpackages.aspx?arch=x86

set useragent=--user-agent="Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0"
set header=--header="Accept: text/html"

set updateFile=mpam-fe.exe


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
%wget% %useragent% -O "%tempPath%\%updateFile%" %linkPath%


echo Copying New Update to Portable Media....
echo.

xcopy "%tempPath%\%updateFile%" "%savePath%" /q /r /y

::pause


:end


