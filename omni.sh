#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive with
# the intent to run in either shell.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ds="date +%Y-%m-%d:%H:%M:%S"

# set my name and version
vibi="OmniDock v0.99"
cpy1="Copyright (c) 2015 Information Builders, Inc."
cpy2="All Rights Reserved."

# hostname to image mappings

data=postgres:9.4
postgres=$data
dba=cibi/omni:dba
wso2is=cibi/omni:wso2is
elasticsearch=cibi/omni:elasticsearch
logstash=cibi/omni:logstash
kibana=cibi/omni:kibana
domain=cibi/omni:domain
remediate=cibi/omni:remediate
workbench=cibi/omni:workbench
opmc=cibi/omni:opmc
wb=cibi/omni:wb


# get my host name and ip address
hostnm=$(hostname)

# define helper functions
showstatus() {
   $0 ip
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
   clist='opmc workbench remediate domain kibana logstash elasticsearch wso2is dba postgres data wb'
   for i in $clist
    do
       stopremove $i
    done
}

signon() {
   echo
   echo "$vibi"
   echo "$cpy1"
   echo "$cpy2"
   echo
}

# figure out a good host ip
boot2docker version 1>/dev/null 2>/dev/null
if [ $? -eq 0 ]; then
   boot2docker ip 1>/dev/null 2>/dev/null
   if [ $? -eq 0 ]; then
      hostip=$(boot2docker ip)
      eval $(boot2docker shellinit 1>/dev/null 2>/dev/null)
   else
      echo "$($ds) Boot2Docker status is $(boot2docker status)"
      echo "$($ds) you should run bin/setup"
      echo
      exit 1
   fi
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
   signon
   echo "Usage: omni [command]"
   echo "A wrapper to start/stop/update the Omni Integrators Workbench"
   echo
   echo "Commands:"
   echo "  ip        lists known ip addresses"
   echo "  ssh       ssh to the named container"
   echo "  logs      show the logs of the named container"
   echo "  start     creates and starts test environment container"
   echo "  stop      stops and removes test environment container"
   echo "  up        shortcut for start all"
   echo "  down      shortcut for stop all"
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
      echo "Containers on $hostnm ($hostip)"
      echo
      cc=$(docker ps -qa | wc -w)
      [ $cc -gt 0 ] && docker ps -a -q | xargs docker inspect --format='{{.NetworkSettings.IPAddress}} {{.Config.Hostname}} ({{.Config.Image}})'
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
      if [ "$2" = "." ]; then 
         boot2docker ssh
      else 
         ssh ibi@$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $2)
      fi
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
# up or start
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "up" ] || [ "$1" = "start" ]; then
   signon
   if [ $# = 1 ]; then
      if [ "$1" = "up" ]; then
         set -- "${@:1}" "all"
      else 
         echo Usage: $0 start [all data postgres dba wso2is events domain remediate workbench opmc server]
         echo
         exit 0
      fi
   fi
   
   # omniwb aka server
   if [ "$2" = "all" ] || [ "$2" = "omniwb" ] || [ "$2" = "server" ]; then
      docker ps | grep omniwb 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) omniwb";else
         echo "$($ds) starting omniwb as $wb"
         docker run -d -h="omniwb" --name omniwb --privileged \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v $(pwd)/data/server:/ibi/omnidock/data/restx \
           -P -p 8086:8086 "$wb" 2>/dev/null 1>/dev/null
         echo "$($ds) sleep 3 secs"
         sleep 3
      fi
   	echo
   	exit
   fi 

   # data
   if [ "$2" = "all" ] || [ "$2" = "data" ] || [ "$2" = "postgres" ] || \
      [ "$2" = "dba" ] || [ "$2" = "domain" ] || [ "$2" = "remediate" ] || \
      [ "$2" = "workbench" ] || [ "$2" = "opmc" ]; then
      cname=data; docker ps -a | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) creating new $cname container" 
         docker create -h="$cname" --name $cname -v /var/lib/postgresql/data \
           "$data" 2>&1 >/dev/null
         echo "$($ds) loading initial metadata"
         docker run --rm --volumes-from $cname -v $(pwd)/data:/data \
           "$data" tar -xzf /data/load/omnidb.tgz
         echo "$($ds) sleep 3 secs"
         sleep 3
      fi
   fi

   # postgres
   if [ "$2" = "all" ] || [ "$2" = "data" ] || [ "$2" = "postgres" ] || \
      [ "$2" = "dba" ] || [ "$2" = "domain" ] || [ "$2" = "remediate" ] || \
      [ "$2" = "workbench" ] || [ "$2" = "opmc" ]; then
      cname=postgres; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $postgres"
         docker run -d -h="$cname" --name $cname \
           --volumes-from data \
           -v /var/lib/postgresql/data -P -p 5432:5432 \
           "$postgres" 2>/dev/null 1>/dev/null
         echo "$($ds) sleep 3 secs"
         sleep 3
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # dba
   if [ "$2" = "all" ] || [ "$2" = "data" ] || [ "$2" = "dba" ]; then
      cname=dba; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $dba"
         docker run -d -h="$cname" --name $cname \
           --link postgres:postgres -p 5430:80 \
           "$dba" 2>/dev/null 1>/dev/null
         echo "$($ds) sleep 3 secs"
         sleep 3
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # end here if up data
   if [ "$2" = "data" ]; then echo;exit;fi;

   # wso2is
   if [ "$2" = "all" ] || [ "$2" = "wso2is" ] || [ "$2" = "remediate" ] || [ "$2" = "opmc" ]; then
      cname=wso2is; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $wso2is"
         docker run -d -P -h="$cname" --name $cname \
           -p 9443:9443 \
           "$wso2is" 2>/dev/null 1>/dev/null
         echo "$($ds) sleep 3 secs"
         sleep 3
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # elasticsearch
   # docker run -d -h="elasticsearch" --name elasticsearch  -P -p 9200:9200 odin.ibi.com:5000/cibi/omni:elasticsearch
   if [ "$2" = "all" ] || [ "$2" = "kibana" ]; then
      cname=elasticsearch; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $elasticsearch"
         docker run -d -P -h="$cname" --name $cname \
           -p 9200:9200 \
           "$elasticsearch" 2>&1 >/dev/null
         sleep 3
         echo "$($ds) sleep 3 secs"
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # logstash
   # docker run -d -h="logstash" --name logstash --link elasticsearch:elasticsearch  -P -p 8500:8500 9292:9292 odin.ibi.com:5000/cibi/omni:logstash
   if [ "$2" = "all" ] || [ "$2" = "kibana" ]; then
      cname=logstash; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $logstash"
         docker run -d -P -h="$cname" --name $cname \
           --link elasticsearch:elasticsearch \
           -P -p 8500:8500 -p 9292:9292 \
           "$logstash" 2>&1 >/dev/null
         sleep 3
         echo "$($ds) sleep 3 secs"
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # kibana
   # docker run -d -h="kibana" --name kibana --link elasticsearch:elasticsearch  -P -p 5601:5601 odin.ibi.com:5000/cibi/omni:kibana
   if [ "$2" = "all" ] || [ "$2" = "kibana" ]; then
      cname=kibana; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $kibana"
         docker run -d -P -h="$cname" --name $cname \
           --link elasticsearch:elasticsearch \
           -p 5601:5601 \
           "$kibana" 2>&1 >/dev/null
         sleep 3
         echo "$($ds) sleep 3 secs"
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # domain
   if [ "$2" = "all" ] || [ "$2" = "domain" ] || [ "$2" = "remediate" ]; then
      cname=domain; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $domain"
         docker run -d -P -h="$cname" --name $cname \
           --link postgres:postgres \
           -p 8080:8080 \
           "$domain" 2>/dev/null 1>/dev/null
         echo "$($ds) sleep 3 secs"
         sleep 3
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # remediate
   if [ "$2" = "all" ] || [ "$2" = "remediate" ]; then
      cname=remediate; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $remediate"
         docker run -d -P -h="$cname" --name $cname \
           --link postgres:postgres --link wso2is:wso2is \
           -p 9065:9999 -p 9066:9280 -p 9100:9100 -p 23:23 \
           "$remediate" 2>/dev/null 1>/dev/null
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # workbench
   if [ "$2" = "all" ] || [ "$2" = "workbench" ]; then
      cname=workbench; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $workbench"
         docker run -d -P -h="$cname" --name $cname \
           --dns=$hostip --env sentinel=$hostip \
           --link postgres:postgres \
           -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22 \
           -p 6199:6199 -p 9502:9502 -p 9504:9504 -p 9506:9506 \
           -v $(pwd)/data/omni/prop/DIB.properties:/ibi/iway7/config/OmniPatient/resource/DIB.properties \
           -v $(pwd)/data/omni:/omni \
           "$workbench" 2>&1 >/dev/null
         docker logs $cname
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

   # opmc
   if [ "$2" = "all" ] || [ "$2" = "opmc" ]; then
      cname=opmc; docker ps | grep $cname 2>/dev/null 1>/dev/null
      if [ $? -eq 0 ]; then echo "$($ds) (checked) '$cname'";else
         echo "$($ds) starting $cname as $opmc"
         docker run -d -P -h="$cname" --name $cname \
           --dns=$hostip --env sentinel=$hostip \
           --link domain:domain --link wso2is:wso2is --link logstash:logstash \
           -p 8888:8080 \
           -v $(pwd)/data/opmc/logs/tomcat7:/ibi/tomcat7/logs \
           "$opmc" 2>&1 >/dev/null
         docker logs $cname
      fi
      if [ "$2" = "$cname" ]; then echo;exit;fi;
   fi

      
   showstatus
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# down or stop
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if [ "$1" = "down" ] || [ "$1" = "stop" ]; then
   signon
   if [ $# = 1 ]; then
      if [ "$1" = "down" ]; then
         set -- "${@:1}" "all"
      else 
         echo Usage: $0 stop [all data postgres dba wso2is events domain remediate workbench opmc server]
         echo
         exit 0
      fi
   fi
   
   if [ "$2" = "all" ]; then 
      stopremoveall
   elif [ "$2" = "data" ] || [ "$2" = "postgres" ]; then
      stopremove dba
      stopremove domain
      stopremove remediate
      stopremove workbench
      stopremove opmc
      stopremove $2
   elif [ "$2" = "wso2is" ]; then
     stopremove remediate
     stopremove opmc
     stopremove $2
   elif [ "$2" = "events" ] ||[ "$2" = "elasticsearch" ]; then
     stopremove logstash
     stopremove kibana
     stopremove remediate
     stopremove opmc
     stopremove $2
   elif [ "$2" = "server" ]; then
	  stopremove omniwb
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
   clist='wb postgres dba wso2is elasticsearch logstash kibana domain remediate workbench opmc'
   
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
echo "unknown $0 command \"$1\""
echo "passing thru to docker"
echo
docker $1 $2 $3 $4 $5 $6
echo
 
