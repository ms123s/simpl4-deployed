#!/bin/bash

if [ -z "$SIMPL4DIR" ] ; then
  export SIMPL4DIR=`pwd`
fi

if [ ! -e "${SIMPL4DIR}/server/felix/config.ini" ] ; then
  echo "Not a simpl4 installation"
  exit 1
fi
export PATH=$SIMPL4DIR/bin:$PATH


echo "#############################"
echo "Simpl4 must be running!!!"
echo "#############################"

#bin/start.sh start

rm -r $SIMPL4DIR/gitrepos/global
rm -r $SIMPL4DIR/gitrepos/global_data
#rm -r $SIMPL4DIR/workspace

mkdir -p $SIMPL4DIR/gitrepos/global_data
cd $SIMPL4DIR/gitrepos/global_data
git init
mkdir -p  $SIMPL4DIR/gitrepos/global_data/store/data
cp  $SIMPL4DIR/etc/users-init-script.sql $SIMPL4DIR/gitrepos/global_data/store/data/script.sql
echo '* -text' > $SIMPL4DIR/gitrepos/global_data/.gitattributes
git config user.name "admin"
git config user.email "admin@someplace.com"
git add * .gitattributes
git commit -m. -a

cd $SIMPL4DIR/gitrepos
git clone https://github.com/ms123s/global-metadata.git global

touch $SIMPL4DIR/noauth
sw generateclasses -storeId global_data
sw generateclasses -storeId global_meta
rm $SIMPL4DIR/noauth

cd $SIMPL4DIR
bin/start.sh stop
sleep 10
cd $SIMPL4DIR/gitrepos/global_data
rm -f store/data/dbh2.*
git commit -m. -a
cd $SIMPL4DIR
tar cf gitrepos.tgz gitrepos
git add gitrepos.tgz

rm -r $SIMPL4DIR/workspace/activiti

