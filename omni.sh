#!/bin/ash

#set my name and version
vibi=0.2

# get my host name and ip address
hostnm=$(hostname)
hostip=$(/sbin/ifconfig eth0 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1)
[ "$hostip" = "" ] && hostip=$(/sbin/ifconfig eth1 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1)
[ "$hostip" = "" ] && hostip=$(/sbin/ifconfig docker0 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1)

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
   echo "  update    updates oiw images and scripts"
   echo "  init      initializes content"
   echo "  ip        lists known ip addresses"        
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

   exit   
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# update
if [ "$1" = "update" ]; then

   srcloc="http://iomnibld:8081/nexus/content/repositories/snapshots/com/iwaysoftware/omni/Workbench-Upgrade/2.0.0-SNAPSHOT"
   srcname=Workbench-Upgrade-2.0.0-20150318.161535-10.zip
   [ ! -f ./ism/$srcname ] && wget -P ./ism $srcloc/$srcname
   cd ism 
   rm -rf Omni*
   unzip *.zip
   cd ..
   
   docker pull cibi/ism:7.0.2
   docker pull postgres:9.4
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
            -p 5432:5432 postgres:9.4 2>&1 >/dev/null
   fi
   
   Check ism
   if [ $rc -gt 0 ]; then
      docker run -d -h="ism" --name ism --dns=$hostip --env sentinel=$hostip \
         -P -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22 \
         -v $(pwd)/ism/OmniPatient:/ibi \
         cibi/ism:7.0.2 2>&1 >/dev/null
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
 
