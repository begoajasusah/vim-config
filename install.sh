#!/usr/bin/env bash

export VIM_REPO="https://github.com/satrionugroho/vim-config.git"
export VIM_INSTALL_DIR="${HOME}/.vim-config"
export VIM_DIR="${HOME}/.vim"
export NEOBUNDLE_URL="https://github.com/Shougo/neobundle.vim"

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
git clone $NEOBUNDLE_URL $VIM_INSTALL_DIR/bundle/neobundle.vim
cd $VIM_INSTALL_DIR

# create symlinks
ln -sf "${VIM_INSTALL_DIR}/.vim" $VIM_DIR
ln -sf "${VIM_INSTALL_DIR}/.vimrc" ${HOME}/.vimrc
ln -sf "${VIM_INSTALL_DIR}/.gvimrc" ${HOME}/.gvimrc

/usr/bin/vim +NeoBundleInstal +qall
