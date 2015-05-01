#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in either shell.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# set my name and version
vibi=0.6

# private registry
repo=odin.ibi.com:5000
wso2is=$repo/cibi/omni:wso2is
domain=$repo/cibi/omni:domain
remediate=$repo/cibi/omni:remediate
workbench=$repo/cibi/omni:workbench

# get my host name and ip address
hostnm=$(hostname)


# define helper functions
showstatus() { 
   echo;docker ps -a;echo;$0 ip
}

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

stopremoveall() {
   stopremove ism;stopremove remediate;stopremove omnidomain;stopremove wso2is;stopremove postgres
   echo removing omnidata
   docker rm omnidata 2>/dev/null 1>/dev/null
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
   echo "  logs      show the logs of the named container"
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
   exit
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
# logs
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "logs" ]; then
   if [ $# -lt 2 ]; then
      [ $(docker ps -qa | wc -w) -gt 0 ] && (echo "ssh requires a name:";echo "$(docker ps -a -q | xargs docker inspect --format='{{.Config.Hostname}}')")
      echo
   else
      docker logs $2 $3 $4 $5
   fi
   exit   
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# init - used internally
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "init" ]; then

   if [ "$2" = "all" ]; then stopremoveall;fi;
   
   # omnidata
   docker ps -a | grep omnidata 2>/dev/null 1>/dev/null
   if [ ! $? -eq 0 ]; then
      echo creating omnidata
      docker create -h="omnidata" --name omnidata \
        -v /var/lib/postgresql/data postgres:9.4 2>&1 >/dev/null
      echo loading initial metadata into omnidata
      docker run --rm --volumes-from omnidata -v $(pwd)/data:/data postgres:9.4 \
        tar -xzf /data/load/omnidb.tgz 
   fi

   # postgres
   docker ps | grep postgres 2>/dev/null 1>/dev/null
   if [ ! $? -eq 0 ]; then
      echo starting postgres
      docker run -d -h="postgres" --name postgres --volumes-from omnidata \
        -v /var/lib/postgresql/data -P -p 5432:5432 postgres:9.4 \
        2>/dev/null 1>/dev/null
   fi
   
   if [ "$3" = "data" ]; then exit;fi;

   # wso2is
   docker ps | grep wso2is 2>/dev/null 1>/dev/null
   if [ ! $? -eq 0 ]; then
      echo starting wso2is 
      docker run -d -h="wso2is" --name wso2is \
         -P -p 9443:9443 \
         $wso2is 2>/dev/null 1>/dev/null
   fi

   # domain
   docker ps | grep omnidomain 2>/dev/null 1>/dev/null
      if [ ! $? -eq 0 ]; then
         echo starting omnidomain
         docker run -d -h="omnidomain" --name omnidomain \
         --link postgres:postgres \
         -P -p 8080:8080 \
         $domain 2>/dev/null 1>/dev/null
      fi
      
   # remediate
   docker ps | grep remediate 2>/dev/null 1>/dev/null
      if [ ! $? -eq 0 ]; then
         echo starting remediate
         docker run -d -t -h="remediate" --name remediate \
         --link postgres:postgres --link wso2is:wso2is \
         -P -p 9065:9999 -p 9066:9280 -p 9100:9100 -p 23:23 \
         $remediate 2>/dev/null 1>/dev/null
      fi

   echo
   docker ps -a
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
      check wso2is
      [ $rc -gt 0 ] && $0 init 
      check omnidomain
      [ $rc -gt 0 ] && $0 init
      check remediate
      [ $rc -gt 0 ] && $0 init 
   fi
   
   check ism
   if [ $rc -gt 0 ]; then
      echo starting $omni
      docker run -d -h="ism" --name ism --dns=$hostip --env sentinel=$hostip \
         --link postgres:postgres \
         -P -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22   \
            -p 6199:6199 -p 9502:9502 -p 9504:9504 -p 9506:9506 \
         -v $(pwd)/data/prop/DIB.properties:/ibi/iway7/config/OmniPatient/resource/DIB.properties \
         -v $(pwd)/data/omni:/omni \
         $workbench 2>&1 >/dev/null
         
      docker logs ism
      
   fi
   showstatus
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# down
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "down" ]; then
   if [ $# = 1 ]; then
      echo 
      echo "Usage : $0 down [all|ism|remediate|omnidomain|wso2is|postgres|omnidata]"
      echo
      exit
   elif [ "$2" = "all" ]; then stopremoveall;
   elif [ "$2" = "omnidata" ]; then
      echo removing omnidata
      docker rm omnidata 2>/dev/null 1>/dev/null
   else
      stopremove $2
   fi
   showstatus
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# test - used internally
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "test" ]; then

   if [ "$2" = "down" ]; then
      stopremove opmc
      showstatus
      exit
   fi

   docker ps | grep $opmc 2>/dev/null 1>/dev/null
   if [ ! $? -eq 0 ]; then
      echo starting $opmc
      docker run -d -h="opmc" --name opmc \
        --link wso2is:wso2is \
        -P -p 8080:8080 \
        -v $(pwd)/data/opmc/logs/tomcat7:/ibi/tomcat7/logs \
        -v $(pwd)/data/opmc/logs/remediation:/ibi/tomcat7/webapps/RemediationService/WEB-INF/config/base/log \
        -v $(pwd)/data/opmc/domains:/ibi/opmc/domains \
        -v $(pwd)/data/opmc/properties:/ibi/opmc/properties \
        $opmc 2>&1 >/dev/null
   fi
   
   showstatus
   exit   
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# update
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "update" ]; then
   echo
   docker pull postgres:9.4
   docker pull $wso2is
   docker pull $domain
   docker pull $remediate
   docker pull $workbench
   removeoldimages
   echo
   docker images
   echo
   exit
fi



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Unknown
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo
echo "unknown omnidock command \"$1\""
$0
 