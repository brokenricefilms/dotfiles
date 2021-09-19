autocmd FileType c nnoremap <leader>e
    \ :sp<cr>:term gcc % -o %< && ./%< && rm ./%< <cr>:startinsert<cr>

autocmd FileType cpp nnoremap <leader>e
    \ :sp<cr>:term g++ -std=c++17 % -o %< && ./%< && rm ./%< <cr> :startinsert<cr>

autocmd FileType python nnoremap <leader>e
    \ :sp<cr>:term python %<cr> :startinsert<cr>

autocmd FileType javascript nnoremap <leader>e
    \ :sp<cr>:term node %<cr> :startinsert<cr>

autocmd FileType go nnoremap <leader>e
    \ :sp<cr>:term go run %<cr> :startinsert<cr>

autocmd FileType ruby nnoremap <leader>e
    \ :sp<cr>:term ruby %<cr> :startinsert<cr>

autocmd FileType sh nnoremap <leader>e
    \ :sp<cr>:term chmod +x ./%  && ./% <cr> :startinsert<cr>
