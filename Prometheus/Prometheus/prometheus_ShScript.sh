#!/bin/bash
apt update
mkdir -p /etc/prometheus
mkdir -p /var/lib/prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.31.1/prometheus-2.31.1.linux-amd64.tar.gz
tar -zxf prometheus-2.31.1.linux-amd64.tar.gz
cd prometheus-2.31.1.linux-amd64/
cp prometheus promtool /usr/local/bin/
cp consoles/ console_libraries/ /etc/prometheus/
cp prometheus.yml /etc/prometheus/
prometheus --version
groupadd --system prometheus
useradd -s /sbin/nologin --system -g prometheus prometheus
chown -R prometheus:prometheus /etc/prometheus/ /var/lib/prometheus/
chmod -R 775 /etc/prometheus/ /var/lib/prometheus/
cd ..
cp prometheus.service  /etc/systemd/system/
systemctl daemon-reload
systemctl start prometheus.service
systemctl enable prometheus.service
systemctl status prometheus.service
