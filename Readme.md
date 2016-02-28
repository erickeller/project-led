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

## Technology stack: etcd + confd + saltstack


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
etcdctl --endpoint http://10.0.3.144:2379 set master_ip $(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
```

### minion

```
etcdctl --endpoint http://10.0.3.144:2379 get master_ip
```

