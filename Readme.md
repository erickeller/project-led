# LED project status indicator

## Introduction

This project initial idea came from our git workshop training.
In order to notice the trainees progress in resolving git exercises we asked them to rise their hands.
But after 4 hours workshop people tend to get tired and the hand rising was not a good idea anymore.

Therefore we came with the idea to create this little project, some LED indicating the progress of each and every attendee.

RED -> not ready
GREEN -> ready
BLUE -> question

The GREEN and blue states can be setup by the trainees (also called minions) with some git aliases:

```
git done
git ask
```
The RED state is setup by the git workshop trainer (also called master)

## Hardware

The hardware configuration is described in the following repository

https://github.com/jogi-k/Teensy-RGB-LED

## Technology stack: etcd + confd + saltstack

Currently we do not intend to distribute etcd as a cluster, but this could be extended in the future.
The etcdsrv stores all required keys for the master and minions configuration.

Basically the presenter (master) update his ip address and all minions /etc/hosts configuration are automatically updated through confd.

### Getting started

This repository comes with a vagrant with lxc provisioner playground. It automatically create:

 * etcdsrv: starting up an etcd server on 10.0.3.7
 * master: automatically adds it's ip 10.0.3.8 to etcd store.
 * minion: automatically configures /etc/hosts when etcd master_ip value changes

try it out:

```
vagrant up --provider lxc --provision
```

More details to find in the following sections

### etcdsvr

```
cd /opt/etcd-v2.3.0-alpha.1-linux-amd64
ETCDSVR_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+') \
./etcd --name etcdsvr --initial-advertise-peer-urls http://${ETCDSVR_IP}:2380 \
--listen-peer-urls http://${ETCDSVR_IP}:2380 \
--listen-client-urls http://${ETCDSVR_IP}:2379,http://127.0.0.1:2379 \
--advertise-client-urls http://${ETCDSVR_IP}:2379 \
--initial-cluster etcdsvr=http://${ETCDSVR_IP}:2380
```

### master

```
ETCDSVR=10.0.3.144
etcdctl --endpoint http://${ETCDSVR}:2379 set master_ip $(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
```

or with curl

```
ETCDSVR=10.0.3.144
curl -L http://${ETCDSVR}:2379/v2/keys/master_ip -XPUT -d value="$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')"
```


### minion

```
ETCDSVR=10.0.3.144
etcdctl --endpoint http://${ETCDSVR}:2379 get master_ip
```

or with curl

```
ETCDSVR=10.0.3.144
curl -L http://${ETCDSVR}:2379/v2/keys/master_ip
```
