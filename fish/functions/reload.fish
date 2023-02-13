function reload --description 'reload fish config file'
    source $HOME/.config/fish/config.fish
    tmux source-file $HOME/.tmux.conf
end
