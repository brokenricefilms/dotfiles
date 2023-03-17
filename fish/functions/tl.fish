function tl --description 'fzf tldr'
    if [ -z "$1" ]
        set command $(fzf_tldr)
        tldr $command
    else
        tldr "$1"
        fi
    end
end
