#!/bin/ash
docker run -it  --link postgres:postgres --rm postgres:9.4 sh -c 'exec psql -h postgres -p 5432 -U postgres << EOF
CREATE DATABASE omni;
CREATE SCHEMA healthviews;
EOF
'
