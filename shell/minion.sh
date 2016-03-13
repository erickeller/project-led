#!/usr/bin/env bash
ETCDSERVER_IP=$1
echo "Installing confd and setting it up..."
CONFD_VERSION=0.12.0-alpha3
CONFD_DIR=/opt/confd-${CONFD_VERSION}
mkdir -p ${CONFD_DIR}
curl -L https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -o ${CONFD_DIR}/confd-${CONFD_VERSION}-linux-amd64
chmod +x ${CONFD_DIR}/confd-${CONFD_VERSION}-linux-amd64
mkdir -p /etc/confd/{conf.d,templates} /usr/local/bin
ln -sf ${CONFD_DIR}/confd-${CONFD_VERSION}-linux-amd64 /usr/local/bin/confd
cp -f /vagrant/files/etc/confd/conf.d/hosts.toml /etc/confd/conf.d/hosts.toml
cp -f /vagrant/files/etc/confd/templates/hosts.tmpl /etc/confd/templates/hosts.tmpl
# add confd service
cp -f /vagrant/files/etc/init.d/confd /etc/init.d/confd
chmod +x /etc/init.d/confd
cat /vagrant/files/etc/default/confd | sed -e "s/##ETCDSERVER_IP##/${ETCDSERVER_IP}/g" > /etc/default/confd
/usr/lib/insserv/insserv -d /etc/init.d/confd
/etc/init.d/confd start
# add confd-watch for manual use
cat /vagrant/files/usr/local/bin/confd-watch | sed -e "s/##ETCDSERVER_IP##/${ETCDSERVER_IP}/g" > /usr/local/bin/confd-watch
chmod +x /usr/local/bin/confd-watch

# install saltstack
apt-get install salt-minion -y
# configure salt-minion pointing to the master
sudo sed -i 's/#master: salt/master: master/' /etc/salt/minion
# copy the master public key
cp -f /vagrant/files/etc/salt/pki/master/master.pub /etc/salt/pki/minion/minion_master.pub
chmod 644 /etc/salt/pki/minion/minion_master.pub
service salt-minion restart
