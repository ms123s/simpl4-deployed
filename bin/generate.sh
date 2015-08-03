#!/bin/bash
H="Content-Type: application/json" 

touch /opt/simpl4/noauth
echo -n "-> CompileGroovy .. "
curl  -H "${H}" -k -XPOST -d'{"service":"compile","method":"compileGroovyAll","params":{}}' "http://admin:admin@localhost/rpc/xyz"

echo
echo
echo -n  "-> createRoutesFromShape .. "
curl  -H "${H}" -k -XPOST -d'{"service":"camel","method":"createRoutesFromShape","params":{}}' "http://admin:admin@localhost/rpc/xyz"
echo
echo

NS_LIST=`curl -H "${H}" -k -XPOST -d'{"service":"git","method":"getRepositories","params":{}}' "http://admin:admin@localhost/rpc/xyz" 2>/dev/null|jq --raw-output  ".result[].name"`
for NS in $NS_LIST
do
   echo -n "-> CreateClasses in:$NS .. "
   curl  -H "${H}" -k -XPOST -d'{"service":"domainobjects","method":"createClasses","params":{storeId:"'${NS}'_meta"}}' "http://admin:admin@localhost/rpc/xyz"
   echo
   echo
done

rm /opt/simpl4/noauth
