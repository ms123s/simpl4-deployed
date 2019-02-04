#!/bin/sh
#
# ex:CONNECT plocal:/opt/simpl4/gitrepos/global_data/store/orientdb/bpmDB admin admin

ORIENTDB_HOME=/opt/simpl4

ORIENTDB_SETTINGS="-Djna.nosys=true -Djava.util.logging.config.file="$ORIENTDB_HOME/etc/orientdb-client-log.properties" -Djava.awt.headless=true"
JAVA_OPTS=-Xmx1024m

java -client $JAVA_OPTS $ORIENTDB_SETTINGS -Dfile.encoding=utf-8  -cp "$ORIENTDB_HOME/server/bundles/*" com.orientechnologies.orient.console.OConsoleDatabaseApp $*
