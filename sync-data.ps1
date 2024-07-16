function auto-git-commit() {
    git add .
    git commit -m "Auto commit"
    git pull
    git push
}

cd C:\Users\master\repos\brokenricefilms\davinci-resolve
auto-git-commit

cd E:\notes
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\obs-studio\
auto-git-commit

cp $profile ~\repos\brokenricefilms\dotfiles\
cp C:\Users\master\AppData\Local\nvim\init.lua ~\repos\brokenricefilms\dotfiles\nvim
cp C:\Users\master\.gitconfig ~\repos\brokenricefilms\dotfiles\
cp C:\Users\master\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ~\repos\brokenricefilms\dotfiles\windows-terminal\
cp C:\Users\master\AppData\Roaming\Mozilla\Firefox\Profiles\3wr0grx7.default-release\user.js ~\repos\brokenricefilms\dotfiles\

cd C:\Users\master\repos\brokenricefilms\dotfiles
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\ok
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\rss-to-email
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\hawaiianTravelerAsset\
auto-git-commit

cd E:\live-4\Music\
yt-dlp --extract-audio --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" --download-archive archive.txt "https://www.youtube.com/playlist?list=PLxkEHjd_ca6fNUJh9CTEbShDVCadJ1dIv"
