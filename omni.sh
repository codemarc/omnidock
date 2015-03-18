#!/bin/ash

#set my name and version
vibi=0.1

# get my host name and ip address
hostnm=$(hostname)

hostip=$(/sbin/ifconfig eth0 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1)
if [ "$hostip" = "" ]; then hostip=$(/sbin/ifconfig eth1 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1);fi
if [ "$hostip" = "" ]; then hostip=$(/sbin/ifconfig docker0 |  grep "inet addr" |  cut -d':' -s -f2 | cut -d' ' -f1);fi

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
	echo "  init      runs init scripts"
	echo "  addr      Gets known ip addresses"        
	echo
	echo
	exit
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# addr
if [ "$1" = "addr" ]; then
    echo
	echo $hostnm $hostip "(localhost)"
	cc=$(docker ps -qa | wc -w)
	if [ $cc -gt 0 ]; then 
	   docker ps -a -q | xargs docker inspect --format='{{.Config.Hostname}} {{.NetworkSettings.IPAddress}} ({{.Config.Image}})'
	fi
    echo
    exit	
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# init
if [ "$1" = "init" ]; then
   ./postgres/init.sh;
   echo
   exit
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# update
if [ "$1" = "update" ]; then
	docker pull cibi/ism:7.0.2
	docker pull postgres:9.4
	docker images
	echo
	exit
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# up
if [ "$1" = "up" ]; then
	cc=$(docker info 2>/dev/null | grep Containers | cut -d':' -s -f2)
	if [ $cc -gt 0 ]; then
	   echo 
	   echo "!!! Warning containers may already exist !!!"
	fi

	docker run -d -h="postgres" --name postgres -p 5432:5432 postgres:9.4 2>&1 >/dev/null

	docker run -d -h="ism" --name ism --env sentinel=$hostip \
		-P -p 9999:9999 -p 9000:9000 -p 9001:9001 -p 9022:22 \
		cibi/ism:7.0.2 2>&1 >/dev/null
	
	echo	
	docker ps -a
	echo
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
 
