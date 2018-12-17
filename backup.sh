#!/bin/bash
# expect NODE_NAME to take backup
# expect NODE_PORT to connect backup service

backupdir=${NODE_NAME}-`date +%F-%H-%M`
mkdir -p /backup/$backupdir
echo "Backup to $backupdir started"
ncat --recv-only $NODE_NAME $NODE_PORT  > /backup/$backupdir/xtrabackup.stream
echo "Backup finished"
