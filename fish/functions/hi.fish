function hi --description 'daily jobs'
    xdg-open "https://feeder.co/reader"
    xdg-open "https://mail.google.com/mail/u/0/#inbox"
    xdg-open "https://mail.google.com/mail/u/1/#inbox"
    xdg-open "https://www.youtube.com/feed/subscriptions"
    xdg-open "https://github.com"

    set -l current_dir (pwd)

    pnpm add -g pnpm
    dnf makecache
    deno upgrade
    tldr --update
    $HOME/.tmux/plugins/tpm/bin/update_plugins all

    cd $HOME/dotfiles/
    nvim --headless "+Lazy! sync" +qa
    git add nvim/lazy-lock.json
    git commit -m "chore: lazy.nvim"

    cd $current_dir
end
