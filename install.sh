#!/usr/bin/env bash

export VIM_REPO="git@github.com:satrionugroho/vim-config.git"
export VIM_INSTALL_DIR="${HOME}/.vim-config"
export VIM_DIR="${HOME}/.vim"

# move to tmp when error on home
cd /tmp

# remove vim folder if exists
if [ -d $VIM_DIR ]; then
  rm -rf $VIM_DIR
fi
if [ -d $VIM_INSTALL_DIR ]; then
  rm -rf $VIM_INSTALL_DIR
fi

git clone $VIM_REPO $VIM_INSTALL_DIR
cd $VIM_INSTALL_DIR

rake
