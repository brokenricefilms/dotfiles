autocmd BufNewFile *.wls 0r ~/.config/nvim/template/wolframscriptTemplate.wls

autocmd BufNewFile *.fish 0r ~/.config/nvim/template/fishTemplate.fish

autocmd BufNewFile *.py 0r ~/.config/nvim/template/pythonTemplate.py

autocmd BufNewFile *.sh 0r ~/.config/nvim/template/shTemplate.sh

autocmd BufNewFile *.cpp 0r ~/.config/nvim/template/cppTemplate.cpp | normal!3j

autocmd BufNewFile *.go 0r ~/.config/nvim/template/goTemplate.go | normal!3j

autocmd BufNewFile *.html 0r ~/.config/nvim/template/htmlTemplate.html | normal!6j

autocmd BufNewFile *.php 0r ~/.config/nvim/template/phpTemplate.php | normal!6j
