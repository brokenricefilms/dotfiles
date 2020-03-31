call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'	
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" fancy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'robertmeta/nofrils'
Plug 'ap/vim-css-color'	
Plug 'prettier/vim-prettier', {	
  \ 'do': 'yarn install',	
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" 2 space when edit html file
autocmd BufRead,BufNewFile *.htm,*.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
set ts=4 sw=4
set number relativenumber
set encoding=UTF-8
set background=dark
syntax enable
set clipboard=unnamedplus
set mouse=a
set autowrite
set autoread
set noswapfile
set nobackup
set nowritebackup

:imap jj <Esc>

" gruvbox
" colorscheme gruvbox
" highlight Normal ctermbg=None

" nofrils
colorscheme nofrils-dark
" colo nofrils-light
" colo nofrils-sepia
" colo nofrils-acme
let g:nofrils_strbackgrounds=1
let g:nofrils_heavycomments=1
" let g:nofrils_heavylinenumbers=1

" highligt cursorline
set cursorline
highlight CursorLine term=none cterm=bold
highlight CursorLine guibg=#303000 ctermbg=234

" tab
nmap tt :tabnew<Return>
nmap <space>t :tabnext<Return>

" Switch tab
nmap <S-Tab> :tabprev<Return>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" nerd tree	
map <C-n> :NERDTreeToggle<CR>	
let NERDTreeShowHidden=1	

" emmet	
let g:user_emmet_leader_key=','

" airline
let g:airline_theme='minimalist'

" nerdcommenter
filetype plugin indent on
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

" coc vim
let g:coc_global_extensions = [
			\ "coc-css",
            \ "coc-html",
			\ "coc-snippets",
            \ "coc-json",
            \ "coc-python",
            \ "coc-tsserver",]

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" prettier	
" Max line length that prettier will wrap on: a number or 'auto' (use	
" textwidth).	
" default: 'auto'	
let g:prettier#config#print_width = 'auto'	

" number of spaces per indentation level: a number or 'auto' (use	
" softtabstop)	
" default: 'auto'	
let g:prettier#config#tab_width = 'auto'	

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).	
" default: 'auto'	
let g:prettier#config#use_tabs = 'auto'	

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string	
" (let prettier choose).	
" default: ''	
let g:prettier#config#parser = ''	

" cli-override|file-override|prefer-file	
" default: 'file-override'	
let g:prettier#config#config_precedence = 'file-override'	

" always|never|preserve	
" default: 'preserve'	
let g:prettier#config#prose_wrap = 'preserve'	

" css|strict|ignore	
" default: 'css'	
let g:prettier#config#html_whitespace_sensitivity = 'css'	

" false|true	
" default: 'false'	
let g:prettier#config#require_pragma = 'false'	
nmap <silent> <space>py <Plug>(Prettier)	
" auto prettier when saved	
let g:prettier#autoformat = 0	
autocmd BufWritePre *.md,*.js,*.html,*.json,*.css,*.scss,*.less,*.graphql Prettier
