# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive
omni=$(pwd)/postgres/omni

echo
echo "---> Building cibi/postgres from $0"
echo "Working directory: $(pwd)"
echo
echo "  step 1: make sure all containers are down"

  ./omni.sh down 1>/dev/null 2>/dev/null

echo  
echo "  step 2: generate fresh $omni.sql"
echo
echo " step 2a: start a base postgres 9.4 as postgres"
echo

  cdb=$(docker run -d -h="postgres" --name postgres -P -p 5432:5432 postgres:9.4)
  Sleep 3
  docker ps
  
  
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
echo " step 3: Dockerize the loaded container as cibi/postgres"
echo
echo "step 3a: save postgres as omnidb"
echo

  docker export $cdb | docker import - omnidb
  
echo
echo "step 3b: stop / remove again"
echo

  ./omni.sh down 1>/dev/null 2>/dev/null
  
echo
echo "step 3c: build the image"
echo

  docker build -t cibi/postgres ./postgres

echo
echo "  step 4: cleanup old images"
echo

  docker rmi omnidb
  docker images | grep '<none>'| awk '{print $3}' | xargs docker rmi 2>/dev/null
  echo  
  docker images  
  

  
