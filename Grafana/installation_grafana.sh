#!/bin/bash
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
apt update
apt install grafana
systemctl start grafana-server
systemctl enable grafana-server
systemctl status grafana-server
