# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in the default shell.

cat <<- EOF > init.sql
	CREATE DATABASE omni;
	\connect omni;
	CREATE SCHEMA healthviews;
EOF

cat postgres/postgre.hv_1.1.1_fk_1.0.0.0.sql >> init.sql

docker run -it  --link postgres:postgres --rm -v $(pwd):/psql postgres:9.4 \
sh -c 'exec psql -h postgres -p 5432 -U postgres -f /psql/init.sql' 

rm init.sql
