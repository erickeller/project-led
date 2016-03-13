#!/usr/bin/env bash
ETCDSERVER_IP=$1
echo "Configure and startup etcd server"
cp -f /vagrant/files/etc/init.d/etcd /etc/init.d/etcd
chmod +x /etc/init.d/etcd
cat /vagrant/files/etc/default/etcd | sed -e "s/##ETCDSERVER_IP##/${ETCDSERVER_IP}/g" > /etc/default/etcd
/usr/lib/insserv/insserv -d /etc/init.d/etcd
/etc/init.d/etcd start
