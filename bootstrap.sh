#!/usr/bin/env bash

# Note: This script runs as root

# Hack to silence all those annoying messages
export DEBIAN_FRONTEND=noninteractive

echo 'apt-get update'
apt-get update >/dev/null

echo 'Installing gcc and friends'
apt-get -y install build-essential >/dev/null

echo 'Installing git and friends'
apt-get -y install git >/dev/null
apt-get -y install python-software-properties python-pip >/dev/null

# see https://github.com/sstephenson/ruby-build/wiki
echo 'Installing ruby compilation dependencies'
apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev >/dev/null
apt-get -y install libmysqlclient-dev >/dev/null

echo 'Installing zsh, ag, etc'
apt-get -y install zsh silversearcher-ag >/dev/null

# Change default shell for user `vagrant`
chsh -s $(which zsh) vagrant
