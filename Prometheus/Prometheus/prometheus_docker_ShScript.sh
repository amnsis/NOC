#!/bin/bash
apt update
apt install docker.io
systemctl stop prometheus.service
systemctl disable prometheus.service
mkdir -p /root/prometheus/data
chmod 777 /root/prometheus/data
cp prometheus.yml /root/prometheus/
docker pull m.docker-registry.ir/prom/prometheus
docker run -d -p 9090:9090 -v /root/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml -v /root/prometheus/data:/prometheus --restart always  m.docker-registry.ir/prom/prometheus

