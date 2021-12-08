function gitDir () {
    isInGitRepo || return
    echo "git status"
    git status -sb
}

function mainThing () {
    echo "you in `pwd`"
    la
}

mainThing

gitDir
