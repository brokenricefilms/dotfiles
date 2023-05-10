function fzf --wraps="fzf"
    set -x FZF_DEFAULT_OPTS "
    --color=fg:#353535,bg:#eeeeee,hl:#353535
    --color=fg+:#353535,bg+:#eeeeee,hl+:#353535
    --color=info:#353535,prompt:#353535,pointer:#353535
    --color=marker:#353535,spinner:#353535,header:#353535"
    command fzf
end
