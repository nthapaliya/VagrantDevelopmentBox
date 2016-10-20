#!/usr/bin/env bash

# Adding github.com to known hosts. Potentially dangerous. Use at own risk
ssh-keyscan github.com >> ~/.ssh/known_hosts

echo 'Cloning dotfiles'
git clone git@github.com:nthapaliya/dotfiles.git ~/.dotfiles &>/dev/null

echo 'Installing dotfiles'
~/.dotfiles/install &>/dev/null

echo "Cloning rvm"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &> /dev/null
curl -sSL https://get.rvm.io | bash &>/dev/null

echo "Cloning huddle and puppet_modules"
mkdir -p ~/OSS
git clone git@github.com:officespacesoftware/huddle.git ~/OSS/huddle &>/dev/null
git clone git@github.com:officespacesoftware/puppet_modules.git ~/OSS/puppet_modules &>/dev/null
