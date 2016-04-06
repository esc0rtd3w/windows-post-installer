@echo off


set nameTitle=Clone This Flash Drive To Another Destination

set usbSource=%~dp0

:main

::set sizeSource=dir /s
::set sizeFreeSpace=dir /s | find "bytes free"

for /f "tokens=*" %%a IN ('"dir /s /-c | find "bytes" | find /v "free""') do @Set sizeFreeSpace=%%a
for /f "tokens=1,2 delims=)" %%a in ("%sizeFreeSpace%") do set sizeSource=%%b

title %nameTitle%

cls
echo Enter Destination To Clone Current Flash Drive To and Press ENTER:
echo.
echo.
echo Example: F:\
echo.
echo.
echo Current Source Size: %sizeSource%
::echo.
::echo Current Target Free Space: %sizeFreeSpace%
echo.
echo.

set /p usbDestination=


if [%usbDestination%]==[] goto main


:preview

cls
echo Source: %usbSource% 
echo.
echo Target: %usbDestination% 
echo.
echo.
echo If you plan to boot from the target [%usbDestination%], it MUST be prepared first!
echo.
echo Target [%usbDestination%] will be ERASED during this process!
echo.
echo BACKUP anything you want saved BEFORE PROCEEDING!!!
echo.
echo.
echo Press ENTER to continue or "B" and ENTER to go back....
echo.
echo.

set /p previewDest=

if [%previewDest%]==[b] goto main
if [%previewDest%]==[B] goto main
if [%previewDest%]==[] goto copy

goto main


:copy
cls
echo This is going to take a while....Hang Tight!
echo.
echo.
echo DO NOT CLOSE THIS WINDOW OR THE CLONING PROCESS WILL FAIL!!!!
echo.
echo.


xcopy "%usbSource%*" "%usbDestination%" /s /e /y /f


echo.
echo.
echo.
echo.
echo Finished!
echo.
echo.
echo Check for any errors and press any key to exit....
echo.
echo.

pause>nul



:end


