function backupGnomeKeyBinding {
  dconf dump '/org/gnome/desktop/wm/keybindings/' >~/dotfiles/gnome/keybindings.dconf
  dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' >~/dotfiles/gnome/custom-keybindings.dconf
}

function restoreGnomeKeyBinding {
  dconf load '/org/gnome/desktop/wm/keybindings/' <~/dotfiles/gnome/keybindings.dconf
  dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' <~/dotfiles/gnome/custom-keybindings.dconf
}

function backupGnomeTerminal {
  dconf dump '/org/gnome/terminal/' >~/dotfiles/gnome/gnomeTerminal.dconf
}

function restoreGnomeTerminal {
  dconf load '/org/gnome/terminal/' <~/dotfiles/gnome/gnomeTerminal.dconf
}

function backupGnomeSetting {
  cd ~/dotfiles/
  git stash
  dconf dump / >~/dotfiles/gnome/gnomeSetting.dconf
  git add .
  git commit -m "backup gnome setting"
  git push
  git stash pop
  cd -
}

function restoreGnomeSetting {
  dconf load / <~/dotfiles/gnome/gnomeSetting.dconf
}
