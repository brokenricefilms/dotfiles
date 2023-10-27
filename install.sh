#!/usr/bin/env sh

rm -rf ~/.bashrc
cp .bashrc ~/

cp .vimrc ~/

git config --global core.editor nano