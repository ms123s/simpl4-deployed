#!/bin/bash

if [ -z "$SIMPL4DIR" ] ; then
   thisdir=$(readlink $0)
   if [ "${thisdir}" != "" ]
   then
      export SIMPL4DIR=$(dirname $(cd `dirname $thisdir`; pwd))
   else
      export SIMPL4DIR=$(dirname $(cd `dirname $0`; pwd))
   fi
   echo "using $SIMPL4DIR"
fi

cd $SIMPL4DIR

CLASSPATH="."
for i in server/bundles/*.jar
do
   CLASSPATH=$CLASSPATH:$i
done


CONFIGFILE=
BUILD=
GEN=
NAMESPACE=
WORKSPACE=
#########################################################
# usage
#########################################################
usage() {
   echo "usage: $0 [-w] [-b] [-g]  -n namespace [-c configfile.xml]"
}

#########################################################
# parameter
#########################################################
shortoptions='n:c:bgw'
longoptions='namespace:configfile:build:workspace:gen'
getopt=$(getopt -o $shortoptions --longoptions  $longoptions -- "$@")
if [ $? != 0 ]; then
   usage
   exit 1;
fi

eval set -- "$getopt"
while true; do
   case "$1" in
      -c|--configfile)
         shift
         CONFIGFILE=$1
         shift
      ;;
      -n|--namespace)
         shift
         NAMESPACE=$1
         shift
      ;;
      -w|--workspace)
         WORKSPACE=true
         shift
      ;;
      -g|--gen)
         GEN=true
         shift
      ;;
      -b|--build)
         BUILD=true
         shift
      ;;
      *)
         break
      ;;
   esac
done

if [ -z "$NAMESPACE" ] ; then
   usage;
   exit 1
fi

if [ -n "$WORKSPACE" ] ; then
   BUILDIR=$SIMPL4DIR/workspace/jooq/build
   GENDIR=$SIMPL4DIR/workspace/jooq/gen
else
   BUILDIR=$SIMPL4DIR/gitrepos/$NAMESPACE/.etc/jooq/build
   GENDIR=$SIMPL4DIR/gitrepos/$NAMESPACE/.etc/jooq/gen
fi

if [ -n "$GENDIR" -a -n "$BUILDIR" ] ; then
   rm -rf $GENDIR
   rm -rf $BUILDIR
else
   usage;
   exit 1
fi

TMPDIR=/tmp/jooq
rm -rf $TMPDIR

CONFIGFILE=$SIMPL4DIR/gitrepos/$NAMESPACE/.etc/jooq/$CONFIGFILE

echo "BUILDIR:$BUILDIR"
echo "GENDIR:$GENDIR"
echo "CONFIGFILE=$CONFIGFILE"

if [ -n "$GEN" ] ; then
   echo "================="
   echo "generate ->"
   echo "================="
   java -classpath $CLASSPATH org.jooq.util.GenerationTool $CONFIGFILE
   
   echo "mv $TMPDIR -> $TMPGEN"
   mv $TMPDIR $GENDIR
fi

if [ -n "$BUILD" ] ; then
   echo "================="
   echo "build ->"
   echo "================="
   rm -rf $BUILDIR
   mkdir -p $BUILDIR
   javac -source 1.7 -target 1.7 -d $BUILDIR -cp $CLASSPATH `find $GENDIR -name "*.java"`
fi
