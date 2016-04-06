@echo off

:: Gets current running directory of batch file
set runPath=%~dp0

set tempPath=%temp%
set savePath=%runPath%
set linkPath=http://download.microsoft.com/download/A/3/8/A38FFBF2-1122-48B4-AF60-E44F6DC28BD8/ENUS/x86/MSEInstall.exe

:: Get update exe name
for %%a in (*.exe) do set updateFile=%%a
cd ..


:getRootDrive

for /l %%a in (1,1,10) do (
    pushd ..
)

set root=%cd%
popd
::echo root: %root%

set wget="%root%_ISO\bin\wget.exe"


%wget% -O "%tempPath%\%updateFile%" %linkPath%


::pause

echo Copying New Update to Portable Media....
echo.

xcopy "%tempPath%\%updateFile%" "%savePath%" /q /r /y

::pause


:end


