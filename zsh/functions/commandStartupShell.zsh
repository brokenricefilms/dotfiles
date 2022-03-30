function gitDir() {
  isInGitRepo || return

  echo ""

  cowsayGitStatus

  echo ""

  git status -sb
}

function mainThing() {

  echo ""

  cowsayPwd

  echo ""

  la
}

mainThing

gitDir
