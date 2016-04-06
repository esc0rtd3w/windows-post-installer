@echo off

:: Standalone link
:: https://www.google.com/chrome/browser/index.html?system=true&standalone=1

set installer=none
set appName=Google Chrome
set silentSwitch=
::set silentSwitch=--system-level

cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%

ping -n 4 127.0.0.1>nul

taskkill /f /im "chrome.exe"