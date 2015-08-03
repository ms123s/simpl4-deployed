#!/bin/sh
/usr/bin/createdb -l de_DE.UTF8 -T template0 --encoding UTF8  -Upostgres $1
if [ $? -eq 0 ] ; then
	echo "CREATE EXTENSION fuzzystrmatch"| psql -Upostgres $1
	echo "CREATE SCHEMA admin"| psql -Upostgres $1
	echo "CREATE SCHEMA common"| psql -Upostgres $1
	echo "CREATE SCHEMA $1"| psql -Upostgres $1
	echo "CREATE EXTENSION ltree"| psql -Upostgres $1
	echo "CREATE EXTENSION pg_trgm"| psql -Upostgres $1

	#if [ "$2" = "withDemoData" ] ; then
	#	psql -Upostgres -f /opt/smallcrm/smallcrm.sql $1 
	#else
	#	psql -Upostgres -f /usr/share/postgresql/9.1/extension/pg_similarity.sql $1 
	#fi
fi
