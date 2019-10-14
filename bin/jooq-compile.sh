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


NAMESPACE=
#########################################################
# usage
#########################################################
usage() {
   echo "usage: $0 -n namespace"
}

#########################################################
# parameter
#########################################################
shortoptions='n:'
longoptions='namespace:'
getopt=$(getopt -o $shortoptions --longoptions  $longoptions -- "$@")
if [ $? != 0 ]; then
   usage
   exit 1;
fi

eval set -- "$getopt"
while true; do
   case "$1" in
      -n|--namespace)
         shift
         NAMESPACE=$1
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

BUILDIR=$SIMPL4DIR/gitrepos/$NAMESPACE/.etc/jooq/build
GENDIR=$SIMPL4DIR/gitrepos/$NAMESPACE/.etc/jooq/




echo "BUILDIR:$BUILDIR"

rm -rf $BUILDIR
mkdir -p $BUILDIR
javac -source 1.7 -target 1.7 -d $BUILDIR -cp $CLASSPATH `find $GENDIR -name "*.java"`

