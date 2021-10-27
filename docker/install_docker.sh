#!/bin/sh
echo "Se desinstalan versiones antiguas de docker"
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "Se configura el repositorio"
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Install Docker Engine"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "Configurar docker sin utilizar sudo"

sudo usermod -aG docker $USER

newgrp docker 

