@echo off
if %3 == off goto:eof

set SERVICE_NAME=Simpl4Service
set SIMPL4DIR=%1
set JETTYPORT=%2
set LAUNCHER=org.ms123.launcher.FelixLauncher
set JVMDLL=%SIMPL4DIR%\jre\bin\client\jvm.dll

set CP=%SIMPL4DIR%/libs/jdt-compiler-3.1.1.jar;%SIMPL4DIR%/libs/xml-w3c.jar;%SIMPL4DIR%/libs/org.apache.felix.main-4.6.1.jar;%SIMPL4DIR%/libs/org.ms123.launcher-1.0.0.jar

set J=-Xmx500m
set J=%J%#-XX:MaxPermSize=256m
set J=%J%#-Djava.security.egd=file:/dev/./urandomx
set J=%J%#-Dworkspace=%SIMPL4DIR%/workspace
set J=%J%#-Dorg.osgi.service.http.port=8070
set J=%J%#-DdisableCheckForReferencesInContentException=true
set J=%J%#-Dgit.repos=%SIMPL4DIR%/gitrepos
set J=%J%#-Dfile.encoding=UTF-8
set J=%J%#-Dgroovy.target.indy=false
set J=%J%#-Dsimpl4.dir=%SIMPL4DIR%
set J=%J%#-Djetty.port=%JETTYPORT%
set J=%J%#-Dkaraf.startLocalConsole=false
set J=%J%#-Dkaraf.systemBundlesStartLevel=0
set J=%J%#-Dkaraf.startRemoteShell=false
set J=%J%#-Dfelix.cm.dir=%SIMPL4DIR%/etc/config
set J=%J%#-Dfelix.fileinstall.dir=%SIMPL4DIR%/gitrepos/.bundles
set J=%J%#-Dorg.ops4j.pax.logging.DefaultServiceLog.level=ERROR
set J=%J%#-Ddrools.dialect.java.compiler=JANINO
set J=%J%#-Dkaraf.shell.init.script=%SIMPL4DIR%/etc/shell.init.script
set J=%J%#-Dfelix.config.properties=file:felix/config.ini


SC QUERY %SERVICE_NAME% | find "RUNNING" >nul
IF %ERRORLEVEL% == 0 (
	ECHO "Service is RUNNING.Stopping .."
	%SIMPL4DIR%\bin\%SERVICE_NAME%.exe //SS//%SERVICE_NAME%  
)
SC QUERY %SERVICE_NAME% | find "STOPPED" >nul
IF %ERRORLEVEL% == 0 (
	ECHO "Service is STOPPED.Removing .."
	%SIMPL4DIR%\bin\%SERVICE_NAME%.exe //DS//%SERVICE_NAME%  
)


ECHO "Starting service.."
%SIMPL4DIR%\bin\%SERVICE_NAME%.exe //IS//%SERVICE_NAME%  --StartPath=%SIMPL4DIR%\server --Description="Simpl4 Service" --Install=%SIMPL4DIR%\bin\%SERVICE_NAME%.exe --Jvm=%JVMDLL% --StartMode=jvm --StartClass=%LAUNCHER% --StartMethod=serviceStart --StopMode=jvm --StopClass=%LAUNCHER% --StopMethod=serviceStop --LogPath=%SIMPL4DIR%\log --StdOutput=auto --StdError=auto --Startup=auto ++JvmOptions=%J% --Classpath=%CP%
%SIMPL4DIR%\bin\%SERVICE_NAME%.exe //ES//%SERVICE_NAME%  

