export COWPATH="$HOME/dotfiles/cows"

function cowsayRandom() {
  cowsay -f "$(\ls ~/dotfiles/cows/ | sort -R | head -1)" $1
}

function cowsayPwd() {
  if hash cowsay 2>/dev/null; then
    cowsayRandom "you in $(pwd)"
  else
    echo "\033[0;32m❯\033[0m you in $(pwd)"
  fi
}

function cowsayGitStatus() {
  isInGitRepo || return
  if hash cowsay 2>/dev/null; then
    cowsayRandom "# git status
    $(git status -sb)"
  else
    echo "\033[0;32m❯\033[0m git status"
  fi
}
