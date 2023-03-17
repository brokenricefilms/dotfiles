function reload --description 'reload fish, tmux config'
    source ~/.config/fish/config.fish
    tmux source ~/.tmux.conf
end
