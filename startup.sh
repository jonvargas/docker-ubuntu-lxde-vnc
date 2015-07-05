#!/bin/bash

# Required if you plan to start SSH
mkdir -p /var/run/sshd

# Sets the user and password with admin permissions
MYUSER=ubuntu
MYPASS=ubuntu
id -u $MYUSER &>/dev/null || useradd --create-home --shell /bin/bash --user-group --groups adm,sudo $MYUSER
echo "$MYUSER:$MYPASS" | chpasswd

# Supervisor keeps X and x11vnc running
exec /usr/bin/supervisord -n
