#!/usr/bin/env bash
ETCDSERVER_IP=$1
MASTER_IP=$2
# setup master ip
apt-get install salt-master -y
sudo sed -i 's/#interface: 0.0.0.0/interface: 0.0.0.0/' /etc/salt/master
sudo sed -i 's/#auto_accept: False/auto_accept: True/' /etc/salt/master
mkdir -p /etc/salt/pki/master/
cp -f /vagrant/files/etc/salt/pki/master/master.pub /etc/salt/pki/master/master.pub
cp -f /vagrant/files/etc/salt/pki/master/master.pem /etc/salt/pki/master/master.pem
# setting the right permissions to the keys
chmod 400 /etc/salt/pki/master/master.pem
chmod 644 /etc/salt/pki/master/master.pub
service salt-master restart
# set salt-master ip address in etcd
etcdctl --endpoint http://${ETCDSERVER_IP}:2379 set master_ip ${MASTER_IP}
