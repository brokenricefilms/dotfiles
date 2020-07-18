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

cp -r ~/git/dotfiles/vifm/* ~/.config/vifm/
cp -r ~/git/dotfiles/nvim/* ~/.config/nvim/
cp ~/git/dotfiles/tmux/.tmux.conf ~/
cp -r ~/git/dotfiles/fish/* ~/.config/fish/

# don't don't uncomment line below this my config
# chane file .gitconfig first, fill your email stuff
# cp ~/git/dotfiles/git/.gitconfig ~/ 

cp ~/git/dotfiles/.selected_editor ~/

# if you have alacritty terminal uncomment line below
# mkdir ~/.config/alacritty
# cp ~/git/dotfiles/alacritty/* ~/.config/alacritty/

# font stuff
cp -r ~/git/dotfiles/.fonts ~/
fc-cache -v
