autocmd BufNewFile *.wls 0r ~/.config/nvim/stuff/wolframscriptTemplate.wls

autocmd BufNewFile *.fish 0r ~/.config/nvim/stuff/fishTemplate.fish

autocmd BufNewFile *.py 0r ~/.config/nvim/stuff/pythonTemplate.py

autocmd BufNewFile *.sh 0r ~/.config/nvim/stuff/shTemplate.sh

autocmd BufNewFile *.cpp 0r ~/.config/nvim/stuff/cppTemplate.cpp | normal!3j

autocmd BufNewFile *.go 0r ~/.config/nvim/stuff/goTemplate.go | normal!3j

autocmd BufNewFile *.html 0r ~/.config/nvim/stuff/htmlTemplate.html | normal!6j
