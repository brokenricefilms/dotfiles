function fzf_git_worktree_remove
	set --local WORKTREE (git worktree list | fzf | awk '{print $1}')
	set --local DEFAULT_GIT_FOLDER (git worktree list | head --lines 1 | awk '{print $1}')

	git worktree remove $WORKTREE --force &>/dev/null
	cd $DEFAULT_GIT_FOLDER
end
