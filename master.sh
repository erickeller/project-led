#!/usr/bin/env bash
# setup master ip
apt-get install salt-master -y
sudo sed -i 's/#interface: 0.0.0.0/interface: 0.0.0.0/' /etc/salt/master
sudo sed -i 's/#auto_accept: False/auto_accept: True/' /etc/salt/master
cp -f /vagrant/files/etc/salt/pki/master/master.p* /etc/salt/pki/master/
# setting the right permissions to the keys
chmod 400 /etc/salt/pki/master/master.pem
chmod 644 /etc/salt/pki/master/master.pub
service salt-master restart
# set salt-master ip address in etcd
etcdctl --endpoint http://10.0.3.7:2379 set master_ip 10.0.3.8
