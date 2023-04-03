function update --description 'update all'
    set --local current_dir (pwd)

    yay
    pnpm add -g pnpm
    tldr --update
    fisher update

    cd $current_dir
end
