function sync_music --description 'sync music playlist on Youtube'
    set -l current_dir (pwd)
    set -l music_dir $HOME/Music/music_i_like/

    rm -rf "$music_dir"
    mkdir -p "$music_dir"
    cd $music_dir

    yt-dlp -f bestaudio --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "https://www.youtube.com/playlist?list=PLcazFfFZIFPld2xu_nAgmbgj5QldQOpUB"

    cd $current_dir
end
