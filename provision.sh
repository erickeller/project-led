#!/usr/bin/env bash
echo "Installing etcd and setting it up..."
apt-get update >/dev/null 2>&1
apt-get dist-upgrade -y >/dev/null 2>&1
apt-get install -y curl >/dev/null 2>&1
curl -L  https://github.com/coreos/etcd/releases/download/v2.3.0-alpha.1/etcd-v2.3.0-alpha.1-linux-amd64.tar.gz -o etcd-v2.3.0-alpha.1-linux-amd64.tar.gz
tar xzvf etcd-v2.3.0-alpha.1-linux-amd64.tar.gz -C /opt/
ln -sf /opt/etcd-v2.3.0-alpha.1-linux-amd64/etcd /usr/local/bin/etcd
ln -sf /opt/etcd-v2.3.0-alpha.1-linux-amd64/etcdctl /usr/local/bin/etcdctl
