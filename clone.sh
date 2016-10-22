#!/usr/bin/env bash

# Adding github.com to known hosts. Potentially dangerous. Use at own risk
ssh-keyscan github.com >> ~/.ssh/known_hosts

echo 'Cloning dotfiles'
git clone -q git@github.com:nthapaliya/dotfiles.git ~/.dotfiles
git clone -q --recursive git@github.com:nthapaliya/prezto.git ~/.zprezto

echo 'Installing dotfiles'
~/Projects/dotfiles/install.sh -i

cd ~/.zprezto && \
  git checkout niraj_custom && \
  ~/Projects/dotfiles/helpers/link-prezto.zsh

echo 'Installing rbenv'
mkdir -p ~/Lang
RBENV_ROOT=$HOME/Lang/rbenv ~/Projects/dotfiles/helpers/install-rbenv.sh
