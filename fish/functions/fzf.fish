function fzf --wraps="fzf"
    set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#353535,bg:#eeeeee,hl:#353535
	--color=fg+:#353535,bg+:#eeeeee,hl+:#353535
	--color=border:#353535,header:#353535,gutter:#353535
	--color=spinner:#353535,info:#353535,separator:#353535
	--color=pointer:#353535,marker:#353535,prompt:#353535"
    command fzf
end
