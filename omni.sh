#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in either shell.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ds="date +%Y-%m-%d:%H:%M:%S"

# set my name and version
vibi=0.8

# private registry
repo=odin.ibi.com:5000

# hostname to image mappings
data=postgres:9.4
postgres=$data
dba=$repo/cibi/omni:dba
wso2is=$repo/cibi/omni:wso2is
domain=$repo/cibi/omni:domain
remediate=$repo/cibi/omni:remediate
workbench=$repo/cibi/omni:workbench
opmc=$repo/cibi/omni:opmc


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

stopremove() {
   docker inspect $1 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then 
      echo "$($ds) stopping $1"
      docker stop $1 2>/dev/null 1>/dev/null
      echo "$($ds) $1 stopped"
      echo "$($ds) removing rm $1"
      docker rm $1 2>/dev/null 1>/dev/null
      echo "$($ds) $1 removed";
   fi
}

stopremoveall() {
   clist='opmc workbench remediate domain wso2is dba postgres data' 
   for i in $clist
    do
       stopremove $i
    done
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
      [ $(docker ps -qa | wc -w) -gt 0 ] && (echo "ssh requires a name (. for boot2docker):";echo "$(docker ps -a -q | xargs docker inspect --format='{{.Config.Hostname}}')")
      echo
   else
      if [ "$2" = "." ]; then boot2docker ssh;
      else ssh ibi@$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $2)
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
# up
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "up" ]; then

   if [ "$2" = "all" ]; then stopremoveall;fi;
   
   # data
   cname=data; docker ps -a | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) creating new $cname container" 
      docker create -h="$cname" --name $cname -v /var/lib/postgresql/data \
        "$data" 2>&1 >/dev/null
      echo "$($ds) loading initial metadata"
      docker run --rm --volumes-from $cname -v $(pwd)/data:/data \
        "$data" tar -xzf /data/load/omnidb.tgz
   fi

   # postgres
   cname=postgres; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $postgres"      
      docker run -d -h="$cname" --name $cname \
        --volumes-from data \
        -v /var/lib/postgresql/data -P -p 5432:5432 \
        "$postgres" 2>/dev/null 1>/dev/null
   fi
   
   # dba
   cname=dba; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $dba"      
      docker run -d -h="$cname" --name $cname \
        --link postgres:postgres -p 5430:80 \
        "$dba" 2>/dev/null 1>/dev/null
   fi

   # end here if up data or up all data
   if [ "$2" = "data" ] || [ "$3" = "data" ]; then echo;exit;fi;


   # wso2is
   cname=wso2is; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $wso2is"
      docker run -d -h="$cname" --name $cname \
        -P -p 9443:9443 \
        "$wso2is" 2>/dev/null 1>/dev/null
   fi

   # domain
   cname=domain; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $domain"
      docker run -d -h="$cname" --name $cname \
        --link postgres:postgres \
        -P -p 8080:8080 \
        "$domain" 2>/dev/null 1>/dev/null
   fi

   # remediate
   cname=remediate; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $remediate"
      docker run -d -h="$cname" --name $cname \
        --link postgres:postgres --link wso2is:wso2is \
        -P -p 9065:9999 -p 9066:9280 -p 9100:9100 -p 23:23 \
        "$remediate" 2>/dev/null 1>/dev/null
   fi


   # workbench
   cname=workbench; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $workbench"
      docker run -d -h="$cname" --name $cname \
        --dns=$hostip --env sentinel=$hostip \
        --link postgres:postgres \
        -P -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22   \
           -p 6199:6199 -p 9502:9502 -p 9504:9504 -p 9506:9506 \
        -v $(pwd)/data/omni/prop/DIB.properties:/ibi/iway7/config/OmniPatient/resource/DIB.properties \
        -v $(pwd)/data/omni:/omni \
        "$workbench" 2>&1 >/dev/null
      docker logs $cname
   fi
   
   # opmc
   cname=opmc; docker ps | grep $cname 2>/dev/null 1>/dev/null
   if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
      echo "$($ds) starting $cname as $opmc"
      docker run -d -h="$cname" --name $cname \
        --dns=$hostip --env sentinel=$hostip \
        --link domain:domain \
        --link wso2is:wso2is \
        -P -p 8888:8080 \
        -v $(pwd)/data/opmc/logs/tomcat7:/ibi/tomcat7/logs \
         "$opmc" 2>&1 >/dev/null
      docker logs $cname
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
      echo Usage : $0 down [all data postgres dba wso2is domain remediate workbench opmc] 
      echo
      exit
   elif [ "$2" = "all" ]; then stopremoveall;
   else 
      stopremove $2
   fi
   showstatus
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# update
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "update" ]; then
   clist='postgres dba wso2is domain remediate workbench opmc'
   for cname in $clist
   do
      eval iname=\$$cname
      echo
      echo docker pull $iname
      docker pull $iname
   done
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
 