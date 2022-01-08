#!/bin/bash
apt update
apt install docker.io
docker pull m.docker-registry.ir/prom/pushgateway
docker run -d -p 9091:9091  --restart always  m.docker-registry.ir/prom/pushgateway
