function update --description 'update all'
    set -l current_dir (pwd)

    yay --noconfirm
    pnpm add -g pnpm
    tldr --update
    $HOME/.tmux/plugins/tpm/bin/update_plugins all

    cd $HOME/dotfiles/
    nvim --headless "+Lazy! sync" +qa
    git add nvim/lazy-lock.json
    git commit -m "chore: lazy.nvim"
    git push

    cd $current_dir
end
