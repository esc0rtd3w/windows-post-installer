@echo off

cls
echo.
echo Removing Apple Application Support (32-bit)....
MsiExec.exe /X{2FE00055-C4F3-4F7A-AEDD-E198D54CF12F} /quiet

echo.
echo.
echo Removing Apple Mobile Device Support....
MsiExec.exe /X{28ED482A-56DB-47D9-8D9E-990FA8CD7D3D} /quiet

echo.
echo.
echo Removing Apple Software Update....
MsiExec.exe /X{789A5B64-9DD9-4BA5-915A-F0FC0A1B7BFE} /quiet

echo.
echo.
echo Removing Bonjour....
MsiExec.exe /X{79155F2B-9895-49D7-8612-D92580E0DE5B} /quiet

echo.
echo.
echo Removing iTunes....
MsiExec.exe /X{B8032A6B-C4D0-4744-B75F-9DDCB56B5C6F} /quiet
