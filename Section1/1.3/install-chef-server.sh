#!/bin/bash
#Update the server
apt-get update
apt-get -y install curl

# create  directories
if [ ! -d /key ]; then
  mkdir /key
fi
if [ ! -d /downloads ]; then
  mkdir /downloads
fi

# download the Chef infra server package
if [ ! -f /downloads/chef-server-core_13.0.17-1_amd64.deb ]; then
  echo "Downloading the Chef server package..."
  wget -nv -P /downloads https://packages.chef.io/files/stable/chef-server/13.0.17/ubuntu/18.04/chef-server-core_13.0.17-1_amd64.deb
fi

# install Chef infra server
if [ ! $(which chef-server-ctl) ]; then
  echo "Installing Chef server..."
  dpkg -i /downloads/chef-server-core_13.0.17-1_amd64.deb
  chef-server-ctl reconfigure

  echo "Waiting for services to be up and running..."
  until (curl -D - http://localhost:8000/_status) | grep "200 OK"; do sleep 15s; done
  while (curl http://localhost:8000/_status) | grep "fail"; do sleep 15s; done

  echo "Creating user and organization..."
  chef-server-ctl user-create chefadmin Chef Admin mail.mamtaj@gmail.com Password@1 --filename /key/chefadmin.pem
  chef-server-ctl org-create chefacademy "Chef Academy." --association_user chefadmin --filename /key/chefacademy.pem
fi

echo "Hey, Chef Infra server is up and running!"
