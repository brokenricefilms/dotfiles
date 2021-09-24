function git_dir () {
    is_in_git_repo || return
    cowthink "git status"
    git status -sb
}

function main_thing () {
    cowthink "you in `pwd`"
    la
}

main_thing

git_dir
