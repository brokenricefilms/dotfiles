function update --description 'update all'
    set --local current_dir (pwd)

    dnf makecache
    pnpm add -g pnpm
    pnpm update -g
    tldr --update
    ~/.tmux/plugins/tpm/bin/update_plugins all
    fisher update

    cd $HOME/dotfiles/
    nvim --headless "+Lazy! sync" +qa
    git add nvim/lazy-lock.json
    git commit -m "chore: lazy.nvim"
    git push

    cd $current_dir
end
