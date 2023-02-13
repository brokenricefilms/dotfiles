function yta --description 'youtube download audio'
    yt-dlp -f bestaudio --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $argv
end
