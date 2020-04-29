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

cd
git clone https://github.com/nicholaspham2311/dotfiles.git
cp ~/dotfiles/nvim/init.vim ~/.config/nvim/
cp ~/dotfiles/tmux/.tmux.conf ~/
cp ~/dotfiles/fish/config.fish ~/.config/fish/
cp ~/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions
cp ~/dotfiles/vifm/vifmrc ~/.config/vifm/
cp ~/dotfiles/vifm/colors/* ~/.config/vifm/colors/
