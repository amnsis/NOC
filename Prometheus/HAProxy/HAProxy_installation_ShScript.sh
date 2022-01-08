#!/bin/bash
apt update
apt install haproxy -y
cp haproxy.cfg /etc/haproxy/haproxy.cfg
haproxy -c -f /etc/haproxy/haproxy.cfg
systemctl daemon-reload
systemctl restart haproxy.service
systemctl status haproxy.service
# firefox localhost:8404/monitor &
