FROM postgres:9.4
MAINTAINER Marc J. Greenberg <marc_greenberg@ibi.com>

ADD patient.sql /docker-entrypoint-initdb.d/
ADD init-db.sh /docker-entrypoint-initdb.d/