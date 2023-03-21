function fzf_git_worktree_change_dir
    if [ ! -n "$argv" ]
        set -l worktree (git worktree list | fzf_down | awk '{print $1}')
        cd $worktree
    else
        set -l default_git_folder (git worktree list | head --lines 1 | awk '{print $1}')
        git worktree add $default_git_folder/.worktree/$argv
        cd $default_git_folder/.worktree/$argv
        git switch -c $argv
    end

    if [ (pwd) = "$HOME" ]
        cd -
    end
end
