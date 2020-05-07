#!/bin/bash
#Update the server
apt-get update
apt-get -y install wget

sudo groupadd hab
sudo useradd hab -g hab
curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | sudo bash 
export HAB_ORIGIN=origin-mj
sudo hab license accept
hab origin key download origin-mj
hab sup run &

echo "Hey, Chef Habitat is installed and Supervisor is running!"
