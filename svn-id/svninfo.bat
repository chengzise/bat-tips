@echo off
set src_dir=%~dp0

:: method 1
::for /f "delims=" %%i in ('svn info ^| findstr "Revision"') do set rev=%%i
::set rev=%rev:~10%

:: method 2
for /f "tokens=4 delims= " %%i in ('svn info ^| findstr "Rev:"') do set rev=%%i

echo #define SVN_REVISION %rev% > "%src_dir%"svnversion.h

