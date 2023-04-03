function change_directory_to_git_root
    cd (git rev-parse --show-toplevel)
end
