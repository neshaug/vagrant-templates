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

# http://meteor.com/main see: https://github.com/meteor/meteor
curl https://install.meteor.com | /bin/sh
