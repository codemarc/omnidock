# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive
omni=$(pwd)/postgres/omni

echo
echo "---> Building a cibi/postgres (data container) from $0"
echo "Working directory: $(pwd)"
echo
echo "  step 1: make sure all containers are down"

  ./omni.sh down 1>/dev/null 2>/dev/null

echo  
echo "  step 2: create a fresh omnidata data volume"
echo

    docker stop omnidata 1>/dev/null 2>/dev/null
    docker rm omnidata 1>/dev/null 2>/dev/null
	odb=$(docker create -v /var/lib/postgresql/data --name omnidata postgres:9.4)
    docker ps -a
	
echo
echo " step 2a: start a base postgres 9.4 as postgres"
echo

  cdb=$(docker run -d -h="postgres" --name postgres --volumes-from omnidata -P -p 5432:5432 postgres:9.4)
  Sleep 3
  docker ps -a
  
  
echo
echo " step 2b: do some dba stuff"
echo 

  cat <<- EOF > init.sql
     CREATE ROLE dqrepo LOGIN PASSWORD 'dqrepo' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
     CREATE DATABASE dqrepo WITH OWNER = dqrepo;
     CREATE ROLE patient LOGIN PASSWORD 'patient' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
     CREATE DATABASE patient WITH OWNER = patient;
EOF
  cat init.sql
  
  docker run -it  --link postgres:postgres --rm -v $(pwd):/psql postgres:9.4 \
  sh -c 'exec psql -h postgres -p 5432 -U postgres -f /psql/init.sql 1>/dev/null 2>/dev/null'
  rm init.sql
  
echo
echo " step 2c: run an ism to do db.create"
echo

  docker run -it --link postgres:postgres --rm -v $(pwd)/ism/OmniPatient:/ibi \
  cibi/omni /bin/bash -c "cd /ibi && ./omni.sh db.create"

echo
echo " step 3: save the volume data as omnidb.tar"
echo

  docker run --rm --volumes-from omnidata -v $(pwd)/postgres:/data \
  cibi/base tar -cvf /data/omnidb.tar /var/lib/postgresql/data
  
echo
echo "  step 4: stop / remove / cleanup"
echo

  ./omni.sh down 1>/dev/null 2>/dev/null
  docker images | grep '<none>'| awk '{print $3}' | xargs docker rmi 2>/dev/null
  echo  
  docker images  
  
 