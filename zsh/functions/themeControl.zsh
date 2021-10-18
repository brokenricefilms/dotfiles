#! /usr/bin/env zsh

light () {
    echo "
set background=light
colorscheme zenbones
highlight markdownH1 guifg=#2C363C guibg=NONE guisp=NONE gui=bold
" > ~/dotfiles/nvim/themeControl.vim
    echo "include ./zenbones.conf
    " > ~/dotfiles/kitty/theme.conf
    mkdir ~/dotfiles/bat/
    cp ~/dotfiles/alacritty/alacritty-light.yml ~/dotfiles/alacritty/alacritty.yml
    echo "--theme=\"GitHub\"" > ~/dotfiles/bat/config
}

dark () {
    # ==gruvbox==
    echo "
set background=dark
colorscheme gruvbox-material" > ~/dotfiles/nvim/themeControl.vim
    echo "include ./gruvbox-dark.conf" > ~/dotfiles/kitty/theme.conf
    mkdir ~/dotfiles/bat/
    cp ~/dotfiles/alacritty/alacritty-dark.yml ~/dotfiles/alacritty/alacritty.yml
    echo "--theme=\"base16\"" > ~/dotfiles/bat/config
}
