function play_music
  local -l music_dir (fd --hidden --type directory ~/Music/ --exclude node_modules | fzf_down --preview 'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa --tree --icons')
  cd $music_dir
  mpv --loop-playlist --shuffle *
end
