#!/bin/bash
set -euo pipefail

if [ ! -z ${BORG_AUTHORIZED_KEYS+x} ]; then
    if [[ ! -d /home/borg/.ssh ]]; then
        mkdir /home/borg/.ssh
    fi
    echo $BORG_AUTHORIZED_KEYS > /home/borg/.ssh/authorized_keys
    chown -R borg.borg /home/borg/.ssh
fi
chown borg.borg /storage

exec /usr/sbin/sshd -D
