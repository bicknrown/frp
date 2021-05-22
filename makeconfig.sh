#!/bin/bash

# script to build frpc/frps config

if [ "${SERVER_OR_CLIENT^^}" = "SERVER" ]; then

	export CONFIG=${CONFIG_PATH}"frps.ini"
	echo "[common]" > "$CONFIG"
	echo "bind_addr = $BIND_ADDR" >> "$CONFIG"
	echo "bind_port = $BIND_PORT" >> "$CONFIG"
	echo "authenticate_heartbeats = $AUTHENTICATE_HEARTBEATS" >> "$CONFIG"
	echo "authentication_method = $AUTHENTICATION_METHOD" >> "$CONFIG"
	echo "token = $TOKEN" >> "$CONFIG"

fi


if [ "${SERVER_OR_CLIENT^^}" = "CLIENT" ]; then

	export CONFIG=${CONFIG_PATH}"frpc.ini"
	echo "[common]" > "$CONFIG"
	echo "server_addr = $SERVER_ADDR" >> "$CONFIG"
	echo "server_port = $SERVER_PORT" >> "$CONFIG"
	echo "authenticate_heartbeats = $AUTHENTICATE_HEARTBEATS" >> "$CONFIG"
	echo "authentication_method = $AUTHENTICATION_METHOD" >> "$CONFIG"
	echo "token = $TOKEN" >> "$CONFIG"

	if [ "${TCP^^}" = "TRUE" ]; then

		if [ "${TCP_RANGE^^}" = "TRUE" ]; then

			echo "[range:tcp]" >> "$CONFIG"

		else

			echo "[tcp]" >> "$CONFIG"

		fi

		echo "type = tcp" >> $CONFIG
		echo "local_ip = $TCP_LOCAL_IP" >> $CONFIG
		echo "local_port = $TCP_LOCAL_PORT" >> $CONFIG
		echo "remote_port = $TCP_REMOTE_PORT" >> $CONFIG
	fi

	if [ "${UDP^^}" = "TRUE" ]; then

		if [ "${UDP_RANGE^^}" = "TRUE" ]; then

			echo "[range:udp]" >> "$CONFIG"

		else

			echo "[udp]" >> "$CONFIG"

		fi

		echo "type = udp" >> $CONFIG
		echo "local_ip = $UDP_LOCAL_IP" >> $CONFIG
		echo "local_port = $UDP_LOCAL_PORT" >> $CONFIG
		echo "remote_port = $UDP_REMOTE_PORT" >> $CONFIG
	fi
	
fi
