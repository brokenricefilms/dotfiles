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

cp ~/git/dotfiles/git/vifm/* ~/.config/vifm/
cp ~/git/dotfiles/git/vifm/colors/* ~/.config/vifm/colors/
cp ~/git/dotfiles/nvim/init.vim ~/.config/nvim/
cp ~/git/dotfiles/ssh/config ~/.ssh/
cp ~/git/dotfiles/tmux/.tmux.conf ~/
cp ~/git/dotfiles/fish/config.fish ~/.config/fish/
cp ~/git/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/
cp ~/git/dotfiles/git/.gitconfig ~/ 
cp ~/git/dotfiles/.selected_editor ~/
mkdir ~/.config/alacritty/
cp ~/git/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/
