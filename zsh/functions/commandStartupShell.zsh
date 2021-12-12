function gitDir () {
    isInGitRepo || return
    echo ""
    echo "\033[0;32m❯\033[0m git status"
    echo ""
    git status -sb
}

function mainThing () {
    echo ""
    echo "\033[0;32m❯\033[0m you in `pwd`"
    echo ""
    la
}

mainThing

gitDir
