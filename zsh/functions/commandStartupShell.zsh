function gitDir () {
    isInGitRepo || return
    echo ""
    echo "👉 git status"
    echo ""
    git status -sb
}

function mainThing () {
    echo ""
    echo "👉 you in `pwd`"
    echo ""
    la
}

mainThing

gitDir
