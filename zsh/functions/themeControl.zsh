light () {
    echo "
set background=light
colorscheme zenbones-lush
" > ~/dotfiles/nvim/themeControl.vim
    echo "include ./zenbones.conf
    " > ~/dotfiles/kitty/theme.conf
    mkdir ~/dotfiles/bat/
    echo "--theme=\"GitHub\"" > ~/dotfiles/bat/config
    cat ~/dotfiles/alacritty/alacritty-light.yml > ~/dotfiles/alacritty/alacritty.yml
}

dark () {
    # ==gruvbox==
    echo "
set background=dark
colorscheme gruvbox-material" > ~/dotfiles/nvim/themeControl.vim
    echo "include ./gruvbox-dark.conf" > ~/dotfiles/kitty/theme.conf
    mkdir ~/dotfiles/bat/
    echo "--theme=\"base16\"" > ~/dotfiles/bat/config
    cat ~/dotfiles/alacritty/alacritty-dark.yml > ~/dotfiles/alacritty/alacritty.yml
}
