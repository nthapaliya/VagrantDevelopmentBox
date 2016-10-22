#!/usr/bin/env bash

echo "Cloning huddle and puppet_modules"
mkdir -p ~/OSS
git clone git@github.com:officespacesoftware/huddle.git --depth 20 ~/OSS/huddle
git clone git@github.com:officespacesoftware/puppet_modules.git --depth 20 ~/OSS/puppet_modules

# see https://github.com/sstephenson/ruby-build/wiki
echo 'Installing ruby compilation dependencies'
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

rbenv update

echo "Attempting to compile ruby"
echo "This may take a while ..."

cd ~/OSS/huddle && \
  rbenv install "$( cut -d - -f 2 .ruby-version )"

echo "Installing bundler"
gem install bundler --no-ri --no-rdoc
rbenv rehash

echo "Running bundle install for the first time"
echo "This may take a while ..."
bundle

# Huddle dependencies
# geos, for huddle
sudo apt-get install -y libgeos-dev
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
# install nodejs npm >/dev/null # consider nvm
# install imagemagick >/dev/null # do we still need this?
# install phantomjs >/dev/null # and this?
