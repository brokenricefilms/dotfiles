autocmd FileType c nnoremap <leader>r
    \ :w<enter>:sp<enter>:term gcc % -o %< && ./%< && rm ./%< <enter>:startinsert<enter>

autocmd FileType cpp nnoremap <leader>r
    \ :w<enter>:sp<enter>:term g++ -std=c++17 % -o %< && ./%< && rm ./%< <enter> :startinsert<enter>

autocmd FileType cs nnoremap <leader>r
    \ :w<enter>:sp<enter>:term mcs % && mono *.exe && rm *.exe <enter> :startinsert<enter>

autocmd FileType python nnoremap <leader>r
    \ :w<enter>:sp<enter>:term python %<enter> :startinsert<enter>

autocmd FileType html nnoremap <leader>r
    \ :w<enter>:!xdg-open %<enter>

autocmd FileType markdown nnoremap <leader>r
    \ :w<enter>:MarkdownPreview<enter>

autocmd FileType javasenteript nnoremap <leader>r
    \ :w<enter>:sp<enter>:term dene run %<enter> :startinsert<enter>

autocmd FileType typesenteript nnoremap <leader>r
    \ :w<enter>:sp<enter>:term deno run %<enter> :startinsert<enter>

autocmd FileType go nnoremap <leader>r
    \ :w<enter>:sp<enter>:term go run %<enter> :startinsert<enter>

autocmd FileType ruby nnoremap <leader>r
    \ :w<enter>:sp<enter>:term ruby %<enter> :startinsert<enter>

autocmd FileType sh nnoremap <leader>r
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd BufEnter *.wls nnoremap <leader>r
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd BufEnter *.wl nnoremap <leader>r
    \ :w<enter>:sp<enter>:term wolframscript -file %<enter> :startinsert<enter>
