#!/bin/bash
echo "noob script :)"
echo "noob script :)"
echo "noob script :)"
echo "noob script :)"
echo "noob script :)"

git clone git@github.com:nicholaspham2311/dotfiles.git
cp ~/dotfiles/nvim/init.vim ~/.config/nvim/
cp ~/dotfiles/tmux/.tmux.conf ~/
cp ~/dotfiles/fish/config.fish ~/.config/fish/
cp ~/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions
cp ~/dotfiles/ranger/* ~/.config/ranger
