function fzf_music
    set --local current_dir (pwd)

    cd ~/Music/

    set --local playlist (fd --hidden --type directory . | fzf_down --preview 'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa --tree --icons')

    if [ ! -n "$playlist" ]
        cd $current_dir
    else
        cd $playlist
        mpv --loop-playlist --shuffle *
        cd $current_dir
    end
end
