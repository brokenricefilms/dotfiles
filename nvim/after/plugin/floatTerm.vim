noremap <leader>a :call Float_term()<CR>

function! Float_term(...)
    let height = float2nr((&lines - 2) * 0.75)
    let row = float2nr((&lines - height) / 2)
    let width = float2nr(&columns * 0.75)
    let col = float2nr((&columns - width) / 2)
    let border_opts = {
                \ 'relative': 'editor',
                \ 'row': row - 1,
                \ 'col': col - 2,
                \ 'width': width + 4,
                \ 'height': height + 2,
                \ 'style': 'minimal'
                \ }
    let opts = {
                \ 'relative': 'editor',
                \ 'row': row,
                \ 'col': col,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'
                \ }
    let top = "╭" . repeat("─", width + 2) . "╮"
    let mid = "│" . repeat(" ", width + 2) . "│"
    let bot = "╰" . repeat("─", width + 2) . "╯"
    let lines = [top] + repeat([mid], height) + [bot]
    let bbuf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
    let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
    let buf = nvim_create_buf(v:false, v:true)
    let s:float_term_win = nvim_open_win(buf, v:true, opts)

    hi float_win_border guifg=#88507D
    call setwinvar(s:float_term_border_win, '&winhl', 'Normal:float_win_border')
    call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
    if a:0 == 0
        terminal
    else
        call termopen(a:1)
    endif
    startinsert
    autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction
