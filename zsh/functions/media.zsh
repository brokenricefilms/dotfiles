alias m='mpv --shuffle --loop-playlist ~/Music/*'
alias yt='yt-dlp -f bestvideo+bestaudio'
alias yta='yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'

function syncMusic() {
  cd ~/Music/
  trash *
  yta "https://thuanpham2311.github.io/l/music"
}
