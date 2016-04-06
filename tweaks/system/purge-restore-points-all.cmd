@echo off


vssadmin delete shadows /for=%systemdrive% /all
::vssadmin delete shadows /for=d: /all
