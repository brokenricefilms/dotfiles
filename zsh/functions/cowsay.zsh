export COWPATH="$HOME/dotfiles/cows"

function cowsayRandom() {
  if hash lolcat 2>/dev/null; then
    cowsay -f "$(\ls ~/dotfiles/cows/*.cow | sort -R | head -1)" $1 | lolcat -t
  else
    cowsay -f "$(\ls ~/dotfiles/cows/ | sort -R | head -1)" $1
  fi
}
