function fzf_git_worktree_remove
    set --local default_git_folder (git worktree list | head --lines 1 | awk '{print $1}')
    set --local worktree (git worktree list | fzf_down | awk '{print $1}')
    if [ "$worktree" = "" ]
        cd $default_git_folder
    else
        git worktree remove $worktree --force
        cd $default_git_folder
    end
end
