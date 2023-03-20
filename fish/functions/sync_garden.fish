function sync_garden
    set -l current_dir (pwd)
    cd ~/repos/thuanowa/garden/
    git add -A
    git commit -m "auto commit"
    git push
    cd $current_dir
end
