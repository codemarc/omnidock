#!/bin/bash
if [ "$sentinel" = "" ]; then sentinel="localhost";fi
echo $sentinel sentinel >> /etc/hosts
/ibi/iway7/bin/startservice.sh base
/usr/sbin/sshd -D