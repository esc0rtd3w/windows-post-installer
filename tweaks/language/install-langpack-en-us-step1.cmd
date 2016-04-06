@echo off

set lang=en-us
set langpack=en.cab

dism /online /add-package /packagepath:%~dp0%lang%\%langpack%


:end

