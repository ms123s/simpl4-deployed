@echo off
setx SIMPL4DIR %2
set SIMPL4DIR=%2
%2\bin\bash.exe %2\bin\setup.sh %1 %2 %3 %4 %5

