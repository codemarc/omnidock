#!/bin/bash

gosu postgres postgres --single <<- EOSQL
    CREATE ROLE dqrepo LOGIN PASSWORD 'dqrepo' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
    CREATE DATABASE dqrepo WITH OWNER = dqrepo;
    CREATE ROLE patient LOGIN PASSWORD 'patient' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
    CREATE DATABASE patient WITH OWNER = patient;
EOSQL

gosu postgres postgres --single < patient.zip
