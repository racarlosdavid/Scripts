#!/bin/sh
echo "Uninstall the Docker Engine, CLI, and Containerd packages \n"
sudo apt-get purge docker-ce docker-ce-cli containerd.io

echo "delete all images, containers, and volumes \n"
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd