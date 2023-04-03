function update --description 'update all'
    set --local current_dir (pwd)

    sudo dnf update -y
    pnpm add -g pnpm
    tldr --update
    fisher update

    cd $current_dir
end
