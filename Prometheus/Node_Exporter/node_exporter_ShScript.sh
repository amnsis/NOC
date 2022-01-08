#!/bin/bash
apt update
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar -zxf node_exporter-1.3.1.linux-amd64.tar.gz
cd node_exporter-1.3.1.linux-amd64/
cp node_exporter /usr/local/bin/
useradd -rs /bin/false node_exporter
chown node_exporter:node_exporter -R /usr/local/bin/node_exporter
cd ..
cp node_exporter.service  /etc/systemd/system/
systemctl daemon-reload
systemctl start node_exporter.service
systemctl status node_exporter.service
systemctl enable node_exporter.service
