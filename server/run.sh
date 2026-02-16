#!/bin/sh

export JETTY_PORT=80
export SIMPL4DIR=/opt/simpl4

#MEMOPT="-Xms3G -Xmx3G"
MEMOPT="-XX:InitialRAMPercentage=80 -XX:MaxRAMPercentage=80"
MODULES="--add-opens java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED"
exec /opt/java/bin/java -server $MODULES -Denvironment.dumpCfgAtStartup=false  $MEMOPT -XX:+UseG1GC -Djdk.util.zip.disableZip64ExtraFieldValidation=true -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dsecurity.warningDefaultUsers=false -Dindex.embeddedToSbtreeBonsaiThreshold=1000000  -Dstorage.disk.useNativeOsAPI=false -Dstorage.wal.allowDirectIO=false  -Djava.security.egd=file:/dev/./urandomx -Dworkspace=$SIMPL4DIR/workspace -Dfile.encoding='UTF-8' -Dorg.apache.felix.eventadmin.Timeout=0 -Dorg.osgi.service.http.port=$CONTROL_PORT -DdisableCheckForReferencesInContentException=true -Dgit.repos=$SIMPL4DIR/gitrepos -Dgroovy.target.indy=false -Dsimpl4.dir=$SIMPL4DIR -Djetty.port=$JETTY_PORT -Dkaraf.startLocalConsole=$START_CONSOLE -Dh2.bindAddress=127.0.0.1 -Dkaraf.systemBundlesStartLevel=0 -Dkaraf.startRemoteShell=false -Dkaraf.base=$SIMPL4DIR -Dfelix.cm.dir=$SIMPL4DIR/etc/config -Detc.dir=$SIMPL4DIR/etc -Dkafka.disabled=true -Dfelix.fileinstall.dir=$SIMPL4DIR/gitrepos/.bundles -Dorg.ops4j.pax.logging.DefaultServiceLog.level=ERROR  -Dfelix.config.properties=file:felix/config.ini -cp ${SIMPL4DIR}/libs/org.apache.felix.main-7.0.3.jar:$SIMPL4DIR/libs/jdt-compiler-3.1.1.jar:$SIMPL4DIR/libs/xml-w3c.jar org.apache.felix.main.Main "$@"
