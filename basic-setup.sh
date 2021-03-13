#!/bin/bash

hostname=$(hostname)

# disable systemd-resolved to fix DNS issue
# systemctl disable systemd-resolved.service
# systemctl stop systemd-resolved
# rm -f /etc/resolv.conf
# echo 'nameserver 10.0.0.1' > /etc/resolv.conf


# update apt cache
apt-get update -y

# install packages
apt-get install traceroute -y
apt-get install net-tools -y
apt-get install bird2 -y

# update configs
cat /tmp/bird.conf >> /etc/bird/bird.conf
cat /tmp/bashrc >> ~/.bashrc
killall -1 bird
tail /var/log/syslog

whoami
printenv
