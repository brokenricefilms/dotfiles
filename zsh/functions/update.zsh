function updateZshPlugin() {
  if hash cowsay 2>/dev/null; then
    cowsayRandom "update zsh plugin"
  else
    echo "update zsh plugin"
  fi

  cd ~/dotfiles/zsh/functions/fzf-zsh-completions/
  git pull --force
  cd -

  cd ~/dotfiles/zsh/functions/fzf-tab/
  git pull --force
  cd -

  cd ~/dotfiles/zsh/functions/zsh-syntax-highlighting/
  git pull --force
  cd -
}

function updateDns() {
  sudo curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts --output /etc/hosts
  if hash cowsay 2>/dev/null; then
    cowsay "sometimes if you not lazy try to clear host cache: chrome://net-internals/#dns"
  else
    echo "sometimes if you not lazy try to clear host cache: chrome://net-internals/#dns"
  fi
  sudo systemctl restart NetworkManager.service
}

function updateDnsNoMessage() {
  sudo curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts --output /etc/hosts
  sudo systemctl restart NetworkManager.service
}

function update() {
  topgrade

  updateDns

  nvim -c "PlugUpdate | qa"

  updateZshPlugin
}
