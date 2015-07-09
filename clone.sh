#!/usr/bin/env bash

# Adding github.com to known hosts. Potentially dangerous. Use at own risk
ssh-keyscan github.com >> ~/.ssh/known_hosts

echo 'Cloning rbenv'
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv &>/dev/null
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build &>/dev/null

echo 'Cloning dotfiles'
git clone git@github.com:nthapaliya/dotfiles.git ~/.dotfiles &>/dev/null

echo "Cloning huddle and puppet_modules"
mkdir -p ~/OSS
git clone git@github.com:officespacesoftware/huddle.git ~/OSS/huddle &>/dev/null
git clone git@github.com:officespacesoftware/puppet_modules.git ~/OSS/puppet_modules &>/dev/null
