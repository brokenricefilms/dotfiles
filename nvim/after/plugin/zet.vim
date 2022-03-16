let g:zettelkasten = "~/sync/note/"

command! ZettelHome :execute ":e" zettelkasten . "README.md"

autocmd BufEnter *.md command! MoveNoteToPublish execute "silent Move ~/sync/note/publish/"
autocmd BufEnter *.md command! MoveNoteToPersonal execute "silent Move ~/sync/note/personal/"

noremap <silent> gn :ZettelHome<enter>:cd %:h<enter>:NumberLineOff<enter>

command! NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . ".md"
noremap <silent> <leader>n :tabnew<enter>:NewZettel<enter>:MoveNoteToPublish<enter>i# <enter><enter>-<enter><enter>---<enter><enter>> #<esc>ggjjA<space>
noremap <silent> <leader>N :tabnew<enter>:NewZettel<enter>:MoveNoteToPersonal<enter>i# <enter><enter>-<enter><enter>---<enter><enter>> #<esc>ggjjA<space>

function! s:make_note_link(l)
    let line = split(a:l[0], ':')
    let ztk_id = l:line[0]
    let ztk_title = substitute(l:line[1], '\#\s\+', '', 'g')
    let mdlink = "[" . ztk_title ."](". ztk_id .")"
    return mdlink
endfunction

autocmd BufRead,BufNewFile *.md inoremap <expr> [[ fzf#vim#complete({
            \ 'source':  'rg --no-heading --smart-case  ^\#\ ',
            \ 'reducer': function('<sid>make_note_link'),
            \ 'options': '--multi --reverse --margin 5%,0',
            \ 'down':    10})

autocmd BufRead,BufNewFile,BufEnter *.md command! TOC execute "normal! ggo<enter>---<esc>gg" | execute"read !ghMdToc %" | execute "normal! ddddggjddddddO<enter>**↓↓Table of Contents↓↓**<esc>:w<enter>ggjjo<enter><details><enter><summary>Click here to show.</summary><esc>/---<enter>o</details><esc>gg:w<enter>"

autocmd BufRead,BufNewFile,BufEnter *.md command! TOCUpdate execute "normal! gg4jdatgg2jddddddggo<enter>---<esc>gg" | execute"read !ghMdToc %" | execute "normal! ddddggjddddddO<enter>**↓↓Table of Contents↓↓**<esc>:w<enter>ggjjo<enter><details><enter><summary>Click here to show.</summary><esc>/---<enter>o</details><esc>gg:w<enter>"

autocmd BufRead,BufNewFile,BufEnter *.md inoremap <c-l> [](.md)<esc>T("=strftime("%Y%m%d%H%M%S")<CR>PT[i

autocmd BufRead,BufNewFile,BufEnter *.md vnoremap <enter> c[<esc>pa](.md)<esc>T("=strftime("%Y%m%d%H%M%S")<CR>PT[yi[t):cd %:h<cr>:edit <cfile><cr>i#<space><esc>po<enter>---<enter><enter>><space>#
" @todo `q:` can't execute nmap enter in normal mode to enter quickly
" @body thuanpham2311
autocmd BufRead,BufNewFile,BufEnter *.md nmap <silent> <enter> 3b//.md)<enter>gf

autocmd BufRead,BufNewFile,BufEnter *.md inoremap <c-k> [](<>)<esc>F<pT[i
autocmd BufRead,BufNewFile,BufEnter *.md vnoremap <c-k> c[<esc>pa](<>)<esc>T<h"*p

" @todo rename header -> change every link name
" @body @thuanpham2311
