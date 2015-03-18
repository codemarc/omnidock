#!/bin/ash
echo "CREATE DATABASE omni;"      > init.sql
echo "CREATE SCHEMA healthviews;" >> init.sql

cat postgres/postgre.hv_1.1.1_fk_1.0.0.0.sql >> init.sql

sleep 1

docker run -it  --link postgres:postgres --rm -v $(pwd):/psql postgres:9.4 \
sh -c 'exec psql -h postgres -p 5432 -U postgres -f /psql/init.sql' 

rm init.sql
