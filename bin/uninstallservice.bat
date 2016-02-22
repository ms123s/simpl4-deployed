@echo off
set SERVICE_NAME=Simpl4Service
set SIMPL4DIR=%1

@echo off
SC QUERY %SERVICE_NAME% | find "RUNNING" >nul
IF %ERRORLEVEL% == 0 (
	ECHO RUNNING
	%SIMPL4DIR%\bin\%SERVICE_NAME%.exe //SS//%SERVICE_NAME%  
)
SC QUERY %SERVICE_NAME% | find "STOPPED" >nul
IF %ERRORLEVEL% == 0 (
	ECHO STOPPED
	%SIMPL4DIR%\bin\%SERVICE_NAME%.exe //DS//%SERVICE_NAME%  --StopTimeout=300
)

REM This is not the right place, but now it`s enough for me @@@MS
echo Remove uninstallkey, first try
reg delete "HKLM\Software\Microsoft\Windows\Currentversion\Uninstall\SIMPL4 1.0" /f /reg:64 
echo Remove uninstallkey, second try
reg delete "HKLM\Software\Microsoft\Windows\Currentversion\Uninstall\SIMPL4 1.0" /f 
