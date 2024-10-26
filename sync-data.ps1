function auto-git-commit() {
    git add .
    git commit -m "Auto commit"
    git pull
    git push
}

cd E:\Music
spotdl sync https://open.spotify.com/playlist/7AJjAReIx8ZDEyMVcxuwzh --save-file data.spotdl

cd C:\Users\master\repos\brokenricefilms\davinci-resolve
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\obs-studio\
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\img
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

