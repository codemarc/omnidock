#!/bin/ash
docker run -it  --link postgres:postgres --rm postgres:9.4 \
sh -c 'exec psql -h postgres -p 5432 -U postgres << EOF
CREATE DATABASE omni;
CREATE SCHEMA healthviews;
EOF
'
docker run -it  --link postgres:postgres --rm -v $(pwd):/psql postgres:9.4 \
sh -c 'exec psql -h postgres -p 5432 -U postgres -f /psql/postgre.hv_1.1.1_fk_1.0.0.0.sql' 

