#!/bin/bash
if [ "$sentinel" = "" ]; then sentinel="localhost";fi
echo $sentinel sentinel >> /etc/hosts
chmod +x **/*.sh
cd /ibi
./omni.sh start &
/usr/sbin/sshd -D