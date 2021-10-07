autocmd FileType c nnoremap <leader>e
    \ :w<enter>:sp<enter>:term gcc % -o %< && ./%< && rm ./%< <enter>:startinsert<enter>

autocmd FileType cpp nnoremap <leader>e
    \ :w<enter>:sp<enter>:term g++ -std=c++17 % -o %< && ./%< && rm ./%< <enter> :startinsert<enter>

autocmd FileType cs nnoremap <leader>e
    \ :w<enter>:sp<enter>:term mcs % && mono *.exe && rm *.exe <enter> :startinsert<enter>

autocmd FileType python nnoremap <leader>e
    \ :w<enter>:sp<enter>:term python %<enter> :startinsert<enter>

autocmd FileType javasenteript nnoremap <leader>e
    \ :w<enter>:sp<enter>:term dene run %<enter> :startinsert<enter>

autocmd FileType typesenteript nnoremap <leader>e
    \ :w<enter>:sp<enter>:term deno run %<enter> :startinsert<enter>

autocmd FileType go nnoremap <leader>e
    \ :w<enter>:sp<enter>:term go run %<enter> :startinsert<enter>

autocmd FileType ruby nnoremap <leader>e
    \ :w<enter>:sp<enter>:term ruby %<enter> :startinsert<enter>

autocmd FileType sh nnoremap <leader>e
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd BufEnter *.wls nnoremap <leader>e
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd BufEnter *.wl nnoremap <leader>e
    \ :w<enter>:sp<enter>:term wolframscript -file %<enter> :startinsert<enter>
