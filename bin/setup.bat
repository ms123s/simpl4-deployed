@echo off
setx SIMPL4DIR %1
set SIMPL4DIR=%1
%1\bin\bash.exe %1\bin\setup.sh %1 %2

