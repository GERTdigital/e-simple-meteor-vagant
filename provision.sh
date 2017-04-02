#!/usr/bin/env bash

apt-get update
apt-get -y upgrade
apt-get install -y git
apt-get install -y htop
apt-get install -y g++
apt-get install -y build-essential

# hostname
hostname esimplevagrant
echo "127.0.0.1 esimplevagrant" >> /etc/hosts
echo "esimplevagrant" > /etc/hostname

# .bashrc
echo "cd /vagrant/app" >> /home/vagrant/.bashrc

# node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# meteor
curl https://install.meteor.com/ | sh

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
# MongoDB for Ubuntu 14.04!!!
echo "deb [ arch=amd64 ] http://repo.mongodb.com/apt/ubuntu trusty/mongodb-enterprise/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-enterprise.list
# MongoDB for Ubuntu 16.04!!!
# echo "deb [ arch=amd64,arm64,ppc64el,s390x ] http://repo.mongodb.com/apt/ubuntu xenial/mongodb-enterprise/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-enterprise.list
apt-get update
apt-get install -y mongodb-enterprise

# for dev mode only!!!
IP=$(ifconfig eth0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1)
sed "s/\(bindIp\: 127\.0\.0\.1\)/\1,$IP/" -i /etc/mongod.conf
service mongod restart

# Mongo URL
command="export MONGO_URL='mongodb://localhost:27017/esimplevagrant'"
echo $command >> /home/vagrant/.bashrc

mkdir -p /data/files
chown -R vagrant:www-data /data/
