#!/usr/bin/env bash
echo "Configure and startup etcd server"
cp -f /vagrant/files/etc/init.d/etcd /etc/init.d/etcd
chmod +x /etc/init.d/etcd
cp -f /vagrant/files/etc/default/etcd /etc/default/etcd
/usr/lib/insserv/insserv -d /etc/init.d/etcd
/etc/init.d/etcd start
