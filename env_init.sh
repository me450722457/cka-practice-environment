#!/bin/bash

mkdir -p /opt/KUCM00302
mkdir -p /data/pv
mkdir -p /data/backup
mkdir -p /opt/KUAL002001  
mkdir -p /opt/kucc00100  
mkdir -p /opt/KUCC00302
kubectl taint node k8s-node1 key=value:NoSchedule
kubectl label nodes k8s-node1 disk=ssd
ssh k8s-node2 sh -c 'systemctl stop kubelet'
cp /etc/kubernetes/pki/etcd/ca.crt /opt/KUCM00302/ca.crt
cp /etc/kubernetes/pki/etcd/peer.crt /opt/KUCM00302/etcd-client.crt
cp /etc/kubernetes/pki/etcd/peer.key /opt/KUCM00302/etcd-client.key
