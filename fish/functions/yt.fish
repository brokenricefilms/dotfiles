function yt --description 'youtube download video'
    yt-dlp -f bestvideo+bestaudio -o "%(title)s.%(ext)s" $argv
end
