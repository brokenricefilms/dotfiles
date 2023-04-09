# TODO: make it work like bash version
function fzf_git_worktree_change_dir
    if [ ! -n "$argv" ]
        set --local worktree (git worktree list | fzf_down | awk '{print $1}')
        cd $worktree
    else
        set --local default_git_folder (git worktree list | head --lines 1 | awk '{print $1}')
        mkdir $default_git_folder/.worktrees
        git worktree add $default_git_folder/.worktrees/$argv
        cd $default_git_folder/.worktrees/$argv
        git switch -c $argv
    end

    if [ (pwd) = "$HOME" ]
        cd -
    end
end
