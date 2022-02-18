autocmd BufEnter * vnoremap <leader>r :'<,'>FloatermSend<enter>:FloatermToggle<enter>

autocmd BufEnter * nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; ./%:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.c nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; gcc %:t -o %:t:r ; ./%:t:r ; rm ./%:t:r<enter>:FloatermToggle<enter>

autocmd BufEnter *.cpp nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; g++ -std=c++17 %:t -o %:t:r ; ./%:t:r ; rm ./%:t:r<enter>:FloatermToggle<enter>

autocmd BufEnter *.cpp nnoremap <leader>R
    \ :w<enter>:FloatermSend cd %:p:h ; ./run<enter>:FloatermToggle<enter>

autocmd BufEnter *.cs nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; mcs %:t ; mono *.exe ; rm *.exe <enter>:FloatermToggle<enter>

autocmd BufEnter *.cs nnoremap <leader>R
    \ :w<enter>:FloatermSend cd %:p:h ; dotnet run <enter>:FloatermToggle<enter>

autocmd BufEnter *.py nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; python %:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.md nnoremap <leader>r
    \ :w<enter>:MarkdownPreview<enter>

autocmd BufEnter *.md nnoremap <leader>R
    \ :w<enter>:FloatermSend! cd %:p:h ; markmap -w %:t<enter>

autocmd BufEnter *.js nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; deno run %:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.ts nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; deno run %:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.go nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; go run %:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.rb nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; ruby %:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.sh nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; chmod +x ./%:t  ; ./%:t <enter>:FloatermToggle<enter>

autocmd FileType sh nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; chmod +x ./%:t  ; ./%:t <enter>:FloatermToggle<enter>

autocmd BufEnter *.wls nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; chmod +x ./%:t  ; ./%:t <enter>:FloatermToggle<enter>

autocmd BufEnter *.wl nnoremap <leader>r
    \ :w<enter>:FloatermSend cd %:p:h ; wolframscript -file %:t<enter>:FloatermToggle<enter>

autocmd BufEnter *.png nnoremap <leader>r  :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.gif nnoremap <leader>r  :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.html nnoremap <leader>r :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.jpeg nnoremap <leader>r :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.jpg nnoremap <leader>r  :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.mp3 nnoremap <leader>r  :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.mkv nnoremap <leader>r  :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.pdf nnoremap <leader>r  :silent !xdg-open '%:p'<enter>
autocmd BufEnter *.epub nnoremap <leader>r :silent !xdg-open '%:p'<enter>
