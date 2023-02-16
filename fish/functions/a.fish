function a --description "git commit"
    git diff
    git status -sb
    echo (set_color --bold green) "Commmit message"
    read -P "❯ " -t commit_message
    git add --all
    git commit -m "$commit_message"
end
