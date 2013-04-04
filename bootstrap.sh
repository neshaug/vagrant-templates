#!/usr/bin/env bash
apt-get update
apt-get install -y python-software-properties
add-apt-repository -y ppa:'chris-lea/node.js'

apt-get update
apt-get install -y  \
    git             \
    tig             \
    vim             \
    curl            \
    nodejs          \
    mongodb

# To debug Meteor (nodejs) server side
npm install -g node-inspector

# http://meteor.com/main see: https://github.com/meteor/meteor
curl https://install.meteor.com | /bin/sh

# Can't run MongoDB in Vagrant share. Adding this environment variable will
# make Meteor use the specified MongoDB instead.
# http://docs.mongodb.org/manual/administration/production-notes/#production-nfs
echo "export MONGO_URL=mongodb://localhost:27017/meteor" >> /home/vagrant/.bashrc
