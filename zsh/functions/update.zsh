# for debian base
if hash apt 2>/dev/null; then
  if hash nala 2>/dev/null; then
    alias ins='sudo nala install -y'
    alias inss='nala search'
    alias uins='sudo nala remove -y'
  else
    alias ins='sudo apt install -y'
    alias inss='apt search'
    alias uins='sudo apt remove -y'
  fi
fi

# for fedora
if hash dnf 2>/dev/null; then
  alias ins='sudo dnf -y install'
  alias inss='dnf search'
  alias uins='sudo dnf -y remove'
fi

# for arch base
if hash pacman 2>/dev/null; then
  alias ins='sudo pacman -S --noconfirm'
  alias inss='pacman -Ss'
  alias ya='yay --noconfirm'
  alias uins='sudo pacman -Rs --noconfirm'

  function switchToJava8() {
    sudo archlinux-java set java-8-openjdk
    archlinux-java status
  }

  function switchToJava11() {
    sudo archlinux-java set java-8-openjdk
    archlinux-java status
  }

  function switchToJava17() {
    sudo archlinux-java set java-17-openjdk
    archlinux-java status
  }
fi

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

  # for debian base
  if hash apt 2>/dev/null; then

    if nala 2>/dev/null; then
      sudo nala update
      sudo nala upgrade -y
      sudo nala autoremove -y
    else
      sudo apt update -y
      sudo apt upgrade -y
      sudo apt autoremove -y
    fi

    flatpak update -y
  fi

  # for fedora
  if hash dnf 2>/dev/null; then
    sudo dnf upgrade -y
    dnf makecache
  fi

  # for arch base
  if hash pacman 2>/dev/null; then
    sudo pacman --sync --refresh --sysupgrade
  fi

  nvim -c "PlugUpdate | qa"

  updateZshPlugin
}
