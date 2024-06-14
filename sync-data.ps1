function auto-git-commit() {
    git add .
    git commit -m "Auto commit"
    git pull
    git push
}

cd C:\Users\master\repos\brokenricefilms\fonts
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\davinci-resolve
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\sound-effect\
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\notes
auto-git-commit

cp $profile ~\repos\brokenricefilms\dotfiles\
cp C:\Users\master\AppData\Local\nvim\init.lua ~\repos\brokenricefilms\dotfiles\nvim
cp C:\Users\master\.gitconfig ~\repos\brokenricefilms\dotfiles\
cp C:\Users\master\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ~\repos\brokenricefilms\dotfiles\windows-terminal\

cd C:\Users\master\repos\brokenricefilms\dotfiles
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\ok
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\docs
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\rss-to-email
auto-git-commit

cd C:\Users\master\repos\brokenricefilms\hawaiianTravelerAsset\
auto-git-commit
