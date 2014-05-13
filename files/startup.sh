#!/bin/sh

if [ -f /sshd-key-gen.sh ]; then
        echo "Regenerating server keys..."
        /sshd-key-gen.sh
        rm /sshd-key-gen.sh
fi

service ssh start
file /syncthing
ls /syncthing
exec /syncthing/syncthing
