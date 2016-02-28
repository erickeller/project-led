#!/usr/bin/env bash
# setup master ip
etcdctl --endpoint http://10.0.3.7:2379 set master_ip 10.0.3.8
