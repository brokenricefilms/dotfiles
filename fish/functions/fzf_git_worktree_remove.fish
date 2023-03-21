function fzf_git_worktree_remove
    set -l default_git_folder (git worktree list | head --lines 1 | awk '{print $1}')
    set -l worktree (git worktree list | fzf_down | awk '{print $1}')
    if [ "$worktree" = "" ]
        cd $default_git_folder
    else
        git worktree remove $worktree
        cd $default_git_folder
    end
end
