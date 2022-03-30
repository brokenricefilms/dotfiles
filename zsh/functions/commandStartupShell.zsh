function gitDir() {
  isInGitRepo || return

  echo ""

  if hash cowsay 2>/dev/null; then
    cowsayRandom "git status"
  else
    echo "\033[0;32m❯\033[0m git status"
  fi

  echo ""

  git status -sb
}

function mainThing() {

  echo ""

  if hash cowsay 2>/dev/null; then
    cowsayRandom "you in $(pwd)"
  else
    echo "\033[0;32m❯\033[0m you in $(pwd)"
  fi

  echo ""

  la
}

mainThing

gitDir
