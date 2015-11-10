@echo off

set P1=%1
set P2=%2
set P3=%3
set P4=%4
IF not [%2] == [] GOTO Next1
set P2=%cd%
:Next1

setx SIMPL4DIR %P2% >nul
set SIMPL4DIR=%P2%
%P2%\bin\bash.exe %P2%\bin\setup.sh %P1% %P2% %P3% %P4%

