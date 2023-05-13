function fzfemoji
    if type -q emoji-fzf
        emoji-fzf preview --prepend | fzf | awk '{ print $1 }' | tr -d "\n" | wl-copy
    else
        pip install emoji-fzf
        emoji-fzf preview --prepend | fzf | awk '{ print $1 }' | tr -d "\n" | wl-copy
    end
end
