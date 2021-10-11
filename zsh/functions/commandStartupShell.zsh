function gitDir () {
    isInGitRepo || return
    cowthink "git status"
    git status -sb
}

function mainThing () {
    cowthink "you in `pwd`"
    la
}

mainThing

gitDir
