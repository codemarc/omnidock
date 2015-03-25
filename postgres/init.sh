# Should be empty till there stuff to do
# Saved for later
# CREATE SCHEMA healthviews;
# cat postgres/postgre.hv_1.1.1_fk_1.0.0.0.sql >> init.sql
#
#cat <<- EOF > init.sql
#  CREATE ROLE dqrepo LOGIN PASSWORD 'dqrepo' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
#  CREATE DATABASE dqrepo WITH OWNER = dqrepo;
#  CREATE ROLE patient LOGIN PASSWORD 'patient' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
#  CREATE DATABASE patient WITH OWNER = patient;
#EOF
#
#docker run -it  --link postgres:postgres --rm -v $(pwd):/psql postgres:9.4 \
#sh -c 'exec psql -h postgres -p 5432 -U postgres -f /psql/init.sql' 
#
#rm init.sql
