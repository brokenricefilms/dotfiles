function ok --description 'auto commit and push to git server'
    git add --all
    git commit -m "[👌Auto commit]"
    git pull
    git push
end
