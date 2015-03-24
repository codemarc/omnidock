#!/bin/bash
if [ "$sentinel" = "" ]; then sentinel="localhost";fi
echo $sentinel sentinel >> /etc/hosts
chmod +x /ibi/iway7/iway7.sh
cd /ibi/iway7 && ./iway7.sh base > /dev/null 2>&1 &
/usr/sbin/sshd -D