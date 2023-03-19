function sync_garden
    set -l current_dir (pwd)
    cd ~/repos/thuanowa/garden/
    git add .
    git commit --amend --no-edit
    git push -f
    cd $current_dir
end
