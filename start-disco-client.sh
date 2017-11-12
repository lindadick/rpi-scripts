#!/bin/bash

sleep 30

${HOME}/disco/disco --start

sleep 4

/usr/local/bin/darkice &

/usr/bin/python3 ${HOME}/disco/disco_update_icecast2.py
