@echo off

set CURDIR=%cd%	
IF [%2] == [] GOTO Next1
set CURDIR=%2%
:Next1

call :Strip %CURDIR%
goto :EOF
:Strip

set CURDIR=%1

setx SIMPL4DIR %CURDIR% >nul
set SIMPL4DIR=%CURDIR%
%CURDIR%\bin\bash.exe %CURDIR%\bin\setup.sh %1 %2 %3 %4 %5

