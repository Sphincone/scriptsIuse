#!/bin/sh

# Find the PID of smbd
PID=$(pgrep smbd)

# If smbd is running, kill it
if [ ! -z "$PID" ]; then
    kill $PID
fi

# Start smbd
/sbin/smbd -D -s /etc/smb.conf
