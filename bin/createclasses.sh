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

if [ ! -e "${SIMPL4DIR}/server/felix/config.ini" ] ; then
  echo "Not a simpl4 installation"
  exit 1
fi



if (( $# != 1 )); then
    echo "createclasses namespace"
		exit 1
fi
NAMESPACE=$1
touch $SIMPL4DIR/noauth
$SIMPL4DIR/bin/sw generateclasses -storeId ${NAMESPACE}_data
$SIMPL4DIR/bin/sw generateclasses -storeId ${NAMESPACE}_meta
rm $SIMPL4DIR/noauth


