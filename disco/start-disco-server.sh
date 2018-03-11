#!/bin/bash

PULSE="pulseaudio"

/usr/bin/pulseaudio --start

echo "Waiting for $PULSE to start..."

while [ -z "$(pgrep "$PULSE" "$@")" ] ; do
    sleep 1
done

echo "$PULSE started with process ID: " $(pgrep "$PULSE" "$@")

${HOME}/disco/discoserver
