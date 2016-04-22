#!/bin/sh
#
#
#

sed -i 's!"file:bundles/!"file:/opt/simpl4/server/bundles/!g' server/felix/config.ini
sed -i 's!org.osgi.framework.storage=felix/cache/runner!org.osgi.framework.storage=/opt/simpl4/server/felix/cache/runner/!g' server/felix/config.ini
