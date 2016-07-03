#!/bin/sh

cd /opt
rm -rf simpl4_tmp
simpl4/bin/start.sh stop
git clone --depth=1 https://github.com/ms123s/simpl4-deployed.git simpl4_tmp
cd simpl4_tmp
tar cf - client server  | ( cd ../simpl4; tar xf -)
cd /opt
rm -rf simpl4_tmp

cd /opt/simpl4/gitrepos/global
git pull
simpl4/bin/start.sh start

