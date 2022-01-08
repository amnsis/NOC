#!/bin/bash
wget https://github.com/prometheus/haproxy_exporter/releases/download/v0.13.0/haproxy_exporter-0.13.0.linux-amd64.tar.gz
tar -zxf haproxy_exporter-0.13.0.linux-amd64.tar.gz
cd haproxy_exporter-0.13.0.linux-amd64
cp haproxy_exporter /usr/local/bin/
useradd haproxy_exporter -rs /bin/false 
chown haproxy_exporter:haproxy_exporter /usr/local/bin/haproxy_exporter
cp ../haproxy_exporter.service /etc/systemd/system/
systemctl daemon-reload
systemctl restart haproxy_exporter.service
systemctl status haproxy_exporter.service

#curl localhost:9101/metrics
