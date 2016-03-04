#!/usr/bin/env bash

echo "Removing logs from initialization."
rm -fv /var/log/*log /var/log/*.gz /var/log/dmesg* /var/log/messages /var/log/cron /var/log/secure
rm -fvr /var/log/syslog /var/log/{b,w}tmp /var/log/udev

echo "Getting rid of bash history."
rm -fv "$HOME/.bash_history"

sleep 3

exit
