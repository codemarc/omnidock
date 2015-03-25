# Build the cibi/omni container in the default shell.
# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in the default shell.

#set my name and version
vibi=0.3

# get my host name and ip address
hostnm=$(hostname)


getmyip() {
   hostip=$(/sbin/ifconfig $1 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1)
}   

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
 
if [ $# -lt 1 ]; then
   echo "Running on $hostnm ($hostip)"
   echo
   echo "OmniDock v$vibi Usage: omni [command]"
   echo "A wrapper to start/stop/update the Omni Integrators Workbench"
   echo
   echo "Commands:"
   echo "  up        creates and starts test environment"
   echo "  down      stops and removes test environment"
   echo "  ssh       ssh to the named container"
   echo "  ip        lists known ip addresses"
   echo "  build     build container updates"
   echo "  init      initializes content"
   echo "  update    updates container images"
   echo "  upgrade   upgrades the workbench" 
   echo
   echo
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ip

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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# init

if [ "$1" = "init" ]; then
    if [ $# -lt 2 ]; then
       $0 $1 postgres
       $0 $1 ism
    else
      ./$2/init.sh   
    fi
    echo
    exit   
fi

   exit   
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ssh

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
# build/init

if [ "$1" = "build" ] || [ "$1" = "init" ]; then
    if [ $# -lt 2 ]; then
       $0 $1 ism
       $0 $1 postgres
    else
      ./$2/$1.sh   
    fi
    echo
    exit   
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# update

if [ "$1" = "update" ]; then
   echo
   docker pull cibi/base
   docker pull postgres:9.4
   echo
   docker images
   echo
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# up

Check() {
   rc=1;cc=$(docker ps -qa | wc -w)
   if [ $cc -gt 0 ]; then 
      docker ps -a -q | xargs docker inspect --format='{{.Name}}' | grep /$1 >/dev/null
      rc=$?
   fi
   [ $rc -eq 0 ] && echo $1' is already up'
}

if [ "$1" = "up" ]; then

   Check postgres
   if [ $rc -gt 0 ]; then 
      docker run -d -h="postgres" --name postgres --dns=$hostip \
            -p 5432:5432 cibi/postgres 2>&1 >/dev/null

	  sleep 5s            
      $0 init postgres            
   fi
   
   Check ism
   if [ $rc -gt 0 ]; then
      docker run -d -h="ism" --name ism --dns=$hostip --env sentinel=$hostip \
         --link postgres:postgres \
         -P -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22 \
         -v $(pwd)/ism/OmniPatient:/ibi cibi/omni 2>&1 >/dev/null
         
      sleep 5s   
      $0 init ism         
   fi
   
   $0 ip
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# down

 StopRemove() {
   docker inspect $1 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then 
      echo "docker stop $1"
      docker stop $1
      echo " stopped"
      echo
      echo "docker rm $1"
      docker rm $1
      echo " removed"
      echo
   fi
 }  

if [ "$1" = "down" ]; then
   StopRemove ism
   StopRemove postgres
   echo
   exit
fi
 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# upgrade
op() {
  echo
  echo "$0 $1"
  $0 $1
}
if [ "$1" = "upgrade" ]; then
	op down
	
	echo 'update from git'
    git config --global core.autocrlf input
    git pull
    echo
	
    
    op update
    op build
    
	echo 'removing old images'
    docker images | grep '<none>'| awk '{print $3}' | xargs docker rmi 2>/dev/null
    echo
    docker images
    echo
    echo "done!"
    
    
    #op up

    exit   
fi
 