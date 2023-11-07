#!/usr/bin/env sh

# codespace

rm -rf ~/.bashrc
cp .bashrc ~/
cp .vimrc ~/

git config --global core.editor vim
