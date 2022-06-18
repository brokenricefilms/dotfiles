if hash yt-dlp 2>/dev/null; then
  alias yt='yt-dlp -f bestvideo+bestaudio'
  alias yta='yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
else
  python3 -m pip install -U yt-dlp
  alias yt='yt-dlp -f bestvideo+bestaudio'
  alias yta='yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
fi

alias m='mpv --shuffle --loop-playlist ~/Music/*'

function update_music() {
  cd ~/Music/
  trash *
  yta "https://thuanpham2311.github.io/l/music"
  cd -
}
