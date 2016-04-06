@echo off

set installer=none
set appName=Adobe Reader
set silentSwitch=/msi EULA_ACCEPT=YES REMOVE_PREVIOUS=YES /qn
set silentSwitch=/msi EULA_ACCEPT=YES /qn

:: Skipping Old Reader
goto dc


:reader
cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%


cls
echo Installing %appName%....

for %%b in (%~dp0update\*.msp) do set update=%%b

"%update%" %silentSwitch%


:dc
cls
echo Installing %appName%....

for %%c in (%~dp0updateDC\*.exe) do set update=%%c

"%update%" %silentSwitch%
