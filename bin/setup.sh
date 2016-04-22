#!/bin/bash

#########################################################
# init
#########################################################
SIMPL4DIR=`pwd`
JETTYPORT=8080
#########################################################
# usage
#########################################################
usage() {
    echo "usage: $0 [-d dir] -p port"
}
#########################################################
# parameter
#########################################################
shortoptions='p:d:'
longoptions='port:dir:'
getopt=$(getopt -o $shortoptions --longoptions  $longoptions -- "$@")
if [ $? != 0 ]; then
   usage
   exit 1;
fi

eval set -- "$getopt"
while true; do
   case "$1" in
      -p|--port)
         shift
         JETTYPORT=$1
         shift
      ;;
      -d|--dir)
         shift
         SIMPL4DIR=$1
         shift
      ;;
      *)
				break
      ;;
   esac
done

echo "Setup in $SIMPL4DIR/Port=$JETTYPORT"

if [ ! -e "${SIMPL4DIR}/server/felix/config.ini" ] ; then
  echo "Not a simpl4 installation" 
  exit 1
fi

cd $SIMPL4DIR
tar xf gitrepos.tgz
mkdir -p gitrepos/global_data/settings


SIMPL4DIR1=$(echo $SIMPL4DIR | grep -o "ROOTFS.*" | cut -c7-)
if [ -n "$SIMPL4DIR1" ] ; then
  SIMPL4DIR=$SIMPL4DIR1
fi

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
sed    "s!_JETTYPORT_!$JETTYPORT!g" bin/start.sh.tpl >bin/start.sh
#sed    "s!_BASEDIR_!$SIMPL4DIR!g" bin/installservice.bat.tpl > bin/installservice.bat
#sed -i "s!_JETTYPORT_!$JETTYPORT!g" bin/installservice.bat
#sed    "s!_BASEDIR_!$SIMPL4DIR!g" bin/uninstallservice.bat.tpl > bin/uninstallservice.bat

chmod +x bin/start.sh
cp etc/branding.example etc/branding


mkdir -p workspace/configadm/org/ops4j/pax/
cp etc/logging.config workspace/configadm/org/ops4j/pax/

