light () {
    # ==color paper==
    echo "
set background=light
colorscheme PaperColor" > ~/dotfiles/nvim/themeControl.vim
    echo "include ./paper.conf" > ~/dotfiles/kitty/theme.conf
    echo "--theme=\"GitHub\"" > ~/dotfiles/bat/config
}

dark () {
    # ==gruvbox==
    echo "
set background=dark
colorscheme gruvbox-material" > ~/dotfiles/nvim/themeControl.vim
    echo "include ./gruvbox-dark.conf" > ~/dotfiles/kitty/theme.conf
    echo "--theme=\"base16\"" > ~/dotfiles/bat/config
    # ==spacecamp==
    # echo "
# set background=dark
# colorscheme spacecamp" > ~/dotfiles/nvim/themeControl.vim
    # echo "include ./spacecamp.conf" > ~/dotfiles/kitty/theme.conf
    # echo "--theme=\"base16\"" > ~/dotfiles/bat/config
}
