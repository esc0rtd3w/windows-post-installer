@echo off


vssadmin delete shadows /for=%systemdrive% /oldest
