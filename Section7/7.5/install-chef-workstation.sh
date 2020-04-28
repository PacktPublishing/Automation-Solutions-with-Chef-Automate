#!/bin/bash
#Update the server
apt-get update
apt-get -y install wget

#Create directory
if [ ! -d /downloads ]; then
  mkdir /downloads
fi

# download the Chef Workstation package
if [ ! -f /downloads/chef-workstation_0.17.5-1_amd64.deb ]; then
  echo "Downloading the Chef server package..."
  wget -nv -P /downloads https://packages.chef.io/files/stable/chef-workstation/0.17.5/ubuntu/18.04/chef-workstation_0.17.5-1_amd64.deb
fi

# install Chef Workstation
  echo "Installing Chef server..."
  dpkg -i /downloads/chef-workstation_0.17.5-1_amd64.deb
# check ruby version
  echo "Checking which ruby..."
  which ruby
  eval "$(chef shell-init bash)"
  echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
  chef shell-init bash
  which ruby

echo "Hey, Chef Workstation is up and running!"
