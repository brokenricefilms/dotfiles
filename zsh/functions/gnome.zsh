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
