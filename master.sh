#!/usr/bin/env bash
# setup master ip
apt-get install salt-master -y
sudo sed -i 's/#interface: 0.0.0.0/interface: 0.0.0.0/' /etc/salt/master
sudo sed -i 's/#auto_accept: False/auto_accept: True/' /etc/salt/master
service salt-master restart
# set salt-master ip address in etcd
etcdctl --endpoint http://10.0.3.7:2379 set master_ip 10.0.3.8
