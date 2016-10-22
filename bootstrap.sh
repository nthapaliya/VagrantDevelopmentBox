#!/usr/bin/env bash

# Note: This script runs as root

# Hack to silence all those annoying messages
export DEBIAN_FRONTEND=noninteractive

echo 'apt-get update'
apt-get update

echo 'Installing gcc and friends'
apt-get -y install build-essential

echo 'Installing git, python and zsh'
apt-get -y install git
apt-get -y install python-software-properties python-pip
apt-get -y install zsh zsh-doc
apt-get -y install stow exuberant-ctags

# neovim
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get -y install neovim

# Change default shell for user `vagrant`
chsh -s "$(which zsh)" vagrant
