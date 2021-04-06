light () {
    # ==color paper==
    echo "
set background=light
colorscheme PaperColor" > ~/git/dotfiles/nvim/themeControl.vim
    echo "include ./paper.conf" > ~/git/dotfiles/kitty/theme.conf
    echo "--theme=\"GitHub\"" > ~/git/dotfiles/bat/config
}

dark () {
    # ==gruvbox==
    echo "
set background=dark
colorscheme gruvbox-material" > ~/git/dotfiles/nvim/themeControl.vim
    echo "include ./gruvbox-dark.conf" > ~/git/dotfiles/kitty/theme.conf
    echo "--theme=\"base16\"" > ~/git/dotfiles/bat/config
    # ==spacecamp==
    # echo "
# set background=dark
# colorscheme spacecamp" > ~/git/dotfiles/nvim/themeControl.vim
    # echo "include ./spacecamp.conf" > ~/git/dotfiles/kitty/theme.conf
    # echo "--theme=\"base16\"" > ~/git/dotfiles/bat/config
}
