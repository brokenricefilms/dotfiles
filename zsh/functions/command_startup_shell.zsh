function git_dir () {
    is_in_git_repo || return
    cowthink -f small "git status"
    git status -sb
}

function main_thing () {
    cowthink -f small "you in `pwd`"
    la
}

main_thing

git_dir
