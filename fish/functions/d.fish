function d --description "fzf change dir tree preview"
    if [ ! -n "$argv" ]
        set -l dir (fd --hidden --type directory . --exclude node_modules --exclude go | fzf --preview 'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r tree -C -L 2')

        if [ ! -z "$dir" ]
            cd "$dir"
            tree -C -L 2
        end
    else
        mkdir -p "$argv"
        cd "$argv"
    end
end
