function fzf-rg-search-widget -d 'find text in files'
    set rg_command "rg --ignore-case --files-with-matches -uu --iglob='!**/.git/' --follow"
    # Start with all files; i.e. .*
    FZF_DEFAULT_COMMAND="$rg_command '.*'" SHELL=fish fzf \
        -m \
        -e \
        --ansi \
        --disabled \
        --bind "change:reload:$rg_command {q} || true" \
        # I'm not sure what this `cut` does — but remove it and the whole thing fails.
        --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2 \
        | fzf_add_to_commandline
end
