function o --description "fzf open-xdg"
    if [ ! -n "$argv" ]
        set -l file (fd --hidden --type file . --exclude .git --exclude node_modules | fzf --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')

        if [ ! -z "$file" ]
            open "$file"
        end
    else
        open "$argv"
    end
end
