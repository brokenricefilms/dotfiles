cowthink -f small "you in `pwd`"
la

is_in_git_repo || return
cowthink -f small "git status"
git status -sb
git diff
