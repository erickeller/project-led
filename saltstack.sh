#!/bin/sh
# add saltstack repository
wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
cat << EOF > /etc/apt/sources.list.d/saltstack.list
deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main
EOF
apt-get update >/dev/null 2>&1
