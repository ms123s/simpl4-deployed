#!/bin/sh
#
#


ORIENTDB_HOME=/opt/simpl4

ORIENTDB_SETTINGS="-Djava.util.logging.config.file="$ORIENTDB_HOME/etc/orientdb-client-log.properties" -Djava.awt.headless=true"
JAVA_OPTS=-Xmx1024m

java -server $JAVA_OPTS $ORIENTDB_SETTINGS -Dfile.encoding=utf-8  -cp "$ORIENTDB_HOME/server/bundles/*" com.orientechnologies.orient.etl.OETLProcessor $*
