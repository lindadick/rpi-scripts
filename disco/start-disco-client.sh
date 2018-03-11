#!/bin/bash

SERVER="Disco Master"
CLIENT="Disco Player"

echo "Waiting for $SERVER to start..."

while [ -z "$(pgrep "$SERVER" "$@")" ] ; do
    sleep 1
done

echo "$SERVER started with process ID: " $(pgrep "$SERVER" "$@")

${HOME}/disco/disco --start

echo "Waiting for $CLIENT to start..."

while [ -z "$(pgrep "$CLIENT" "$@")" ] ; do
    sleep 1
done

echo "$CLIENT started with process ID: " $(pgrep "$CLIENT" "$@")

darkice &

/usr/bin/python3 ${HOME}/disco/disco_update_icecast2.py
