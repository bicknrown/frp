#!/bin/bash

# start client/server

if [ "${SERVER_OR_CLIENT^^}" = "SERVER" ]; then

	/usr/bin/frps -c /etc/frp/frps.ini

fi

if [ "${SERVER_OR_CLIENT^^}" = "CLIENT" ]; then

	/usr/bin/frpc -c /etc/frp/frpc.ini

fi
