#!/bin/bash
echo "In setup.sh:$1"
if [ -n "$1" ] ; then
    SIMPL4DIR="$1"
else
    SIMPL4DIR=`pwd`
fi 
if [ -n "$2" ] ; then
    JETTYPORT="$2"
else
    JETTYPORT=8080
fi 
echo "Setup in $SIMPL4DIR/Port=$JETTYPORT"

if [ ! -e "${SIMPL4DIR}/server/felix/config.ini" ] ; then
  echo "Not a simpl4 installation" 
  exit 1
fi

cd $SIMPL4DIR
tar xf gitrepos.tgz
mkdir -p gitrepos/global_data/settings


JAVAEXEC=java
if [ -d "$SIMPL4DIR/jre" ] ; then
    JAVAEXEC="%SIMPL4DIR%\\\\jre\\\\bin\\\\java"
fi

SIMPL4DIR1=$SIMPL4DIR
SIMPL4DIR=$(echo $SIMPL4DIR1| sed "s!\\\!\\\\\\\\!g")
SIMPL4DIR2=$(echo $SIMPL4DIR1| sed "s!\\\!/!g")
echo "SIMPL4DIR:$SIMPL4DIR"
LOGDIR=$SIMPL4DIR/log
mkdir -p log

sed    "s!_BASEDIR_!$SIMPL4DIR!g" etc/logging.config.tpl >  etc/logging.config
sed -i "s!_LOGDIR_!$LOGDIR!g" etc/logging.config
sed    "s!_BASEDIR_!$SIMPL4DIR!g" etc/logback.xml.tpl > etc/logback.xml
sed -i "s!_LOGDIR_!$LOGDIR!g" etc/logback.xml
sed    "s!_BASEDIR_!$SIMPL4DIR2!g" etc/config/org/ops4j/pax/logging.config.tpl > etc/config/org/ops4j/pax/logging.config
sed    "s!_BASEDIR_!$SIMPL4DIR!g" server/run.bat.tpl > server/run.bat
sed -i "s!_JAVAEXEC_!$JAVAEXEC!g" server/run.bat
sed -i "s!_JETTYPORT_!$JETTYPORT!g" server/run.bat
#sed    "s!_BASEDIR_!$SIMPL4DIR!g" bin/installservice.bat.tpl > bin/installservice.bat
#sed -i "s!_JETTYPORT_!$JETTYPORT!g" bin/installservice.bat
#sed    "s!_BASEDIR_!$SIMPL4DIR!g" bin/uninstallservice.bat.tpl > bin/uninstallservice.bat

cp etc/branding.example etc/branding


mkdir -p workspace/configadm/org/ops4j/pax/
cp etc/logging.config workspace/configadm/org/ops4j/pax/

