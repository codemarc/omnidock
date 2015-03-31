#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Build the cibi/omni container in the default shell.
# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in the default shell.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#set my name and version
vibi=0.4

# get my host name and ip address
hostnm=$(hostname)


# define helper functions

getmyip() {
   hostip=$(/sbin/ifconfig $1 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1)
}  

removeoldimages() {
   docker images | grep '<none>'| awk '{print $3}' | xargs docker rmi 2>/dev/null
}

check() {
  rc=1;cc=$(docker ps -qa | wc -w)
  if [ $cc -gt 0 ]; then 
     docker ps -a -q | xargs docker inspect --format='{{.Name}}' | grep /$1 >/dev/null
     rc=$?
  fi
  [ $rc -eq 0 ] && echo $1' is already up'
}

stopremove() {
   docker inspect $1 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then 
      echo;echo "docker stop $1";docker stop $1;echo " stopped";echo
      echo;echo "docker rm $1";docker rm $1;echo " removed";echo
   fi
}  


# figure out a good host ip

boot2docker 2>/dev/null
if [ $? -eq 0 ]; then
   hostip=$(boot2docker ip)
else
   getmyip eth0
   [ "$hostip" = "" ] && getmyip eth1
   [ "$hostip" = "" ] && getmyip docker0
fi 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Help
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
if [ $# -lt 1 ]; then
   echo "Running on $hostnm ($hostip)"
   echo
   echo "OmniDock v$vibi Usage: omni [command]"
   echo "A wrapper to start/stop/update the Omni Integrators Workbench"
   echo
   echo "Commands:"
   echo "  ip        lists known ip addresses"
   echo "  ssh       ssh to the named container"
   echo "  up        creates and starts test environment"
   echo "  down      stops and removes test environment"
   echo "  update    updates container images"
   echo
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ip
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "ip" ]; then
   if [ $# -lt 2 ]; then
      echo
      echo $hostnm $hostip "(localhost)"
      cc=$(docker ps -qa | wc -w)
      [ $cc -gt 0 ] && docker ps -a -q | xargs docker inspect --format='{{.Config.Hostname}} {{.NetworkSettings.IPAddress}} ({{.Config.Image}})'
      echo
   else
      docker inspect --format='{{.NetworkSettings.IPAddress}}' $2
   fi
fi   


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ssh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "ssh" ]; then
   if [ $# -lt 2 ]; then
      [ $(docker ps -qa | wc -w) -gt 0 ] && (echo "ssh requires a name:";echo "$(docker ps -a -q | xargs docker inspect --format='{{.Config.Hostname}}')")
      echo
   else
      ssh ibi@$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $2)
   fi
   exit   
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# init - used internally
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "init" ]; then

   if [ "$2" = "odin" ]; then
      sed -i 's/#DOCKER_OPTS=.*/DOCKER_OPTS="--insecure-registry odin.ibi.com:5000"/' /etc/default/docker
      exit
   fi

   if [ "$2" = "all" ]; then
      stopremove ism
      stopremove postgres
      echo removing omnidata
      docker rm omnidata 2>/dev/null 1>/dev/null
   fi
   
   docker ps -a | grep omnidata 2>/dev/null 1>/dev/null
   if [ ! $? -eq 0 ]; then
      echo creating omnidata
      docker create -h="omnidata" --name omnidata \
        -v /var/lib/postgresql/data postgres:9.4 2>&1 >/dev/null
      echo loading initial metadata into omnidata
      docker run --rm --volumes-from omnidata -v $(pwd):/data postgres:9.4 \
        tar -xzf /data/omnidb.tgz 
   fi
   
   docker ps | grep postgres 2>/dev/null 1>/dev/null
   if [ ! $? -eq 0 ]; then
      echo starting postgres
      docker run -d -h="postgres" --name postgres --volumes-from omnidata \
        -v /var/lib/postgresql/data -P -p 5432:5432 postgres:9.4 \
        2>/dev/null 1>/dev/null
   fi
   echo
   exit   
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# up
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "up" ]; then

   if [ "$2" = "all" ]; then
      $0 init all
   else 
      check postgres
      [ $rc -gt 0 ] && $0 init 
   fi
   
   check ism
   if [ $rc -gt 0 ]; then
      docker run -d -h="ism" --name ism --dns=$hostip --env sentinel=$hostip \
         --link postgres:postgres \
         -P -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22 \
         -v $(pwd)/data:/omni/ids cibi/omni 2>&1 >/dev/null
   fi
   
   $0 ip
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# down
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "down" ]; then
   stopremove ism
   if [ "$2" = "all" ]; then
      stopremove postgres
      docker rm omnidata 2>/dev/null 1>/dev/null
   fi
   
   $0 ip
   exit
fi

 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# update
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "update" ]; then
   echo
   docker pull postgres:9.4
   
   
   echo
   docker images
   echo
   exit
fi


 