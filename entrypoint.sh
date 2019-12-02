#!/bin/bash

if [ "$ROOTPWD" != "" ] && [ ! -e /root/.rdp-entrypoint-executed ]; then
	echo "Setting root passwd"
	echo "root:$ROOTPWD" | chpasswd
	touch /root/.rdp-entrypoint-executed
fi

killall xrdp
killall xrdp-sesman

rm -f /var/run/xrdp-sesman.pid /var/run/xrdp.pid

xrdp-sesman &
xrdp &
