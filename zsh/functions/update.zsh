function updateZshPlugin() {
  echo "update zsh plugin"

  cd ~/dotfiles/zsh/functions/fzf-zsh-completions/
  git pull
  cd -

  cd ~/dotfiles/zsh/functions/fzf-tab/
  git pull
  cd -

  cd ~/dotfiles/zsh/functions/zsh-syntax-highlighting/
  git pull
  cd -
}

function updateDns() {
  sudo curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts --output /etc/hosts
  echo "sometimes if you not lazy try to clear host cache: chrome://net-internals/#dns"
}

function updateDnsNoMessage() {
  sudo curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts --output /etc/hosts
  sudo systemctl restart NetworkManager.service
}

function update() {
  # @todo: support other distro
  sudo dnf upgrade

  nvim -c "PlugUpdate | qa"

  updateZshPlugin
}
