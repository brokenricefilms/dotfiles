function fzf_open
    if [ ! -n "$argv" ]
        set -l file (fd --hidden --type directory ~/Music/ --exclude node_modules | fzf_down --preview 'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa --tree --icons')

        if [ ! -z "$file" ]
            open "$file"
        end
    else
        open "$argv"
    end
end
