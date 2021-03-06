#!/usr/bin/env bash
ETCD_VERSION=v2.3.0-alpha.1
echo "Installing etcd and setting it up..."
apt-get update >/dev/null 2>&1
apt-get dist-upgrade -y >/dev/null 2>&1
apt-get install -y curl >/dev/null 2>&1
curl -L  https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -o etcd-${ETCD_VERSION}-linux-amd64.tar.gz
tar xzvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz -C /opt/
ln -sf /opt/etcd-${ETCD_VERSION}-linux-amd64/etcd /usr/local/bin/etcd
ln -sf /opt/etcd-${ETCD_VERSION}-linux-amd64/etcdctl /usr/local/bin/etcdctl
