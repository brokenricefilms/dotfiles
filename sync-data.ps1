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

cd C:\Users\master\repos\brokenricefilms\notes
auto-git-commit
