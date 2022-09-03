alias ins='sudo apt install -y'
alias inss='apt search'
alias uins='sudo apt remove -y'

function updateZshPlugin() {
  echo "\n👉 update zsh plugin"

  cd ~/dotfiles/zsh/functions/fzf-zsh-completions/
  pwd
  git pull
  cd -

  cd ~/dotfiles/zsh/functions/fzf-tab/
  pwd
  git pull
  cd -

  cd ~/dotfiles/zsh/functions/zsh-syntax-highlighting/
  pwd
  git pull
  cd -
}

function update() {
  echo "\n👉 update system"

  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
  tldr --update

  nvim -c "PlugUpdate | qa"

  updateZshPlugin
}
