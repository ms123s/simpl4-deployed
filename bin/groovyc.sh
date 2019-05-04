#!/bin/bash

cd /opt/simpl4/gitrepos/ges
CLASSPATH="build:"
for i in /opt/simpl4/server/bundles/*.jar
do
  CLASSPATH=$CLASSPATH:$i
done

touch groovy/.dirty
groovyc -d build -cp $CLASSPATH `find groovy -name "*.groovy"` 2>&1   | fgrep -v "WARNING: "
