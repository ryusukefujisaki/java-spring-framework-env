#!/bin/bash

set -eux

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

sudo curl -L "https://github.com/docker/compose/releases/download/v2.17.0/docker-compose-$(uname -s)-$(uname -m)" \
     -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a vagrant docker

docker-compose -f /home/vagrant/java-spring-framework-env/docker-compose.yml build --no-cache
docker-compose -f /home/vagrant/java-spring-framework-env/docker-compose.yml up -d
