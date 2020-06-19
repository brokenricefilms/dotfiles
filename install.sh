#!/usr/bin/env bash
echo "
 ________________
< noob script :) >
 ----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ____________________________________________________
< make sure you had dir (nvim, vifm,...) in .config >
 ----------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"

mkdir ~/.config/nvim/
mkdir ~/.config/fish/
mkdir ~/.config/fish/functions/
mkdir ~/.config/vifm/
mkdir ~/.config/alacritty

cp -r ~/git/dotfiles/vifm/* ~/.config/vifm/
cp -r ~/git/dotfiles/nvim/* ~/.config/nvim/
cp -r ~/git/dotfiles/ssh/* ~/.ssh/
cp ~/git/dotfiles/tmux/.tmux.conf ~/
cp -r ~/git/dotfiles/fish/* ~/.config/fish/
cp ~/git/dotfiles/git/.gitconfig ~/ 
cp ~/git/dotfiles/.selected_editor ~/
cp ~/git/dotfiles/alacritty/* ~/.config/alacritty/
