function auto-git-commit() {
    git add .
    git commit -m "Auto commit"
    git pull
    git push
}

cd E:\Music\
spotdl sync https://music.youtube.com/playlist?list=PLxkEHjd_ca6c_0QtpQtBJz8PnppxYWv08 --save-file data.spotdl  --audio youtube-music --bitrate auto --sponsor-block --generate-lrc
cd -

cd C:\Users\master\repos\vndmp4\davinci-resolve
auto-git-commit

cd C:\Users\master\repos\vndmp4\obs-studio\
auto-git-commit

cp $profile ~\repos\vndmp4\dotfiles\
cp C:\Users\master\AppData\Local\nvim\init.lua ~\repos\vndmp4\dotfiles\nvim
cp C:\Users\master\.gitconfig ~\repos\vndmp4\dotfiles\
cp C:\Users\master\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ~\repos\vndmp4\dotfiles\windows-terminal\
cp C:\Users\master\AppData\Roaming\Mozilla\Firefox\Profiles\3wr0grx7.default-release\user.js ~\repos\vndmp4\dotfiles\

cd C:\Users\master\repos\vndmp4\dotfiles
auto-git-commit
