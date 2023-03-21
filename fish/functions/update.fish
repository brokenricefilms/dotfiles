function update --description 'update all'
    set --local current_dir (pwd)

    sudo pacman -Syu --noconfirm
    yay -Sua --noconfirm
    pnpm add -g pnpm
    tldr --update
    $HOME/.tmux/plugins/tpm/bin/update_plugins all
    fisher update

    cd $HOME/dotfiles/
    nvim --headless "+Lazy! sync" +qa
    git add nvim/lazy-lock.json
    git commit -m "chore: lazy.nvim"
    git push

    cd $current_dir
end
