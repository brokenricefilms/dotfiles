autocmd FileType c nnoremap <leader>e
    \ :sp<enter>:term gcc % -o %< && ./%< && rm ./%< <enter>:startinsert<enter>

autocmd FileType cpp nnoremap <leader>e
    \ :sp<enter>:term g++ -std=c++17 % -o %< && ./%< && rm ./%< <enter> :startinsert<enter>

autocmd FileType python nnoremap <leader>e
    \ :sp<enter>:term python %<enter> :startinsert<enter>

autocmd FileType javasenteript nnoremap <leader>e
    \ :sp<enter>:term dene run %<enter> :startinsert<enter>

autocmd FileType typesenteript nnoremap <leader>e
    \ :sp<enter>:term deno run %<enter> :startinsert<enter>

autocmd FileType go nnoremap <leader>e
    \ :sp<enter>:term go run %<enter> :startinsert<enter>

autocmd FileType ruby nnoremap <leader>e
    \ :sp<enter>:term ruby %<enter> :startinsert<enter>

autocmd FileType sh nnoremap <leader>e
    \ :sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>
