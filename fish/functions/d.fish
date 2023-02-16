function d --description "fzf change dir tree preview"
    set -l dir (fd --hidden --type directory . --exclude node_modules --exclude go | fzf --preview 'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r tree -C -L 2')

    cd "$dir"

    tree -C -L 2
end
