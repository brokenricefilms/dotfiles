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

function update() {
  # @todo: support other distro
  sudo dnf upgrade -y

  nvim -c "PlugUpdate | qa"

  updateZshPlugin
}
