autocmd BufEnter *.c nnoremap <leader>r
    \ :w<enter>:sp<enter>:term gcc % -o %< && ./%< && rm ./%< <enter>:startinsert<enter>

autocmd BufEnter *.cpp nnoremap <leader>r
    \ :w<enter>:sp<enter>:term g++ -std=c++17 % -o %< && ./%< && rm ./%< <enter> :startinsert<enter>

autocmd BufEnter *.cpp nnoremap <leader>R
    \ :w<enter>:sp<enter>:term ./run <enter> :startinsert<enter>

autocmd BufEnter *.cs nnoremap <leader>r
    \ :w<enter>:sp<enter>:term mcs % && mono *.exe && rm *.exe <enter> :startinsert<enter>

autocmd BufEnter *.cs nnoremap <leader>R
    \ :w<enter>:sp<enter>:term dotnet run <enter> :startinsert<enter>

autocmd BufEnter *.python nnoremap <leader>r
    \ :w<enter>:sp<enter>:term python %<enter> :startinsert<enter>

autocmd BufEnter *.md nnoremap <leader>r
    \ :w<enter>:MarkdownPreview<enter>

autocmd BufEnter *.md nnoremap <leader>R
    \ :FloatermSend! cd %:p:h ; markmap -w %<enter>

autocmd BufEnter *.js nnoremap <leader>r
    \ :w<enter>:sp<enter>:term deno run %<enter> :startinsert<enter>

autocmd BufEnter *.ts nnoremap <leader>r
    \ :w<enter>:sp<enter>:term deno run %<enter> :startinsert<enter>

autocmd BufEnter *.go nnoremap <leader>r
    \ :w<enter>:sp<enter>:term go run %<enter> :startinsert<enter>

autocmd BufEnter *.rb nnoremap <leader>r
    \ :w<enter>:sp<enter>:term ruby %<enter> :startinsert<enter>

autocmd BufEnter *.sh nnoremap <leader>r
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd FileType sh nnoremap <leader>r
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd BufEnter *.wls nnoremap <leader>r
    \ :w<enter>:sp<enter>:term chmod +x ./%  && ./% <enter> :startinsert<enter>

autocmd BufEnter *.wl nnoremap <leader>r
    \ :w<enter>:sp<enter>:term wolframscript -file %<enter> :startinsert<enter>

autocmd BufEnter *.png nnoremap <leader>r  :silent !xdg-open '%'<enter>
autocmd BufEnter *.html nnoremap <leader>r :silent !xdg-open '%'<enter>
autocmd BufEnter *.jpeg nnoremap <leader>r :silent !xdg-open '%'<enter>
autocmd BufEnter *.jpg nnoremap <leader>r  :silent !xdg-open '%'<enter>
autocmd BufEnter *.mp3 nnoremap <leader>r  :silent !xdg-open '%'<enter>
autocmd BufEnter *.mkv nnoremap <leader>r  :silent !xdg-open '%'<enter>
autocmd BufEnter *.pdf nnoremap <leader>r  :silent !xdg-open '%'<enter>
autocmd BufEnter *.epub nnoremap <leader>r :silent !xdg-open '%'<enter>
