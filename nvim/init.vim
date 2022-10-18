call plug#begin()
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'https://github.com/junegunn/fzf.vim'

let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.9,
      \ 'highlight': 'Comment',
      \ 'rounded': v:true } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_preview_window = ['down:80%', 'ctrl-/']
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

noremap <leader>F :Files ~<enter>
noremap <leader>f :Files<enter>
noremap <leader>j :Rg<enter>
noremap ; :Commands<enter>

Plug 'https://github.com/tpope/vim-eunuch'

Plug 'https://github.com/christoomey/vim-tmux-navigator'

Plug 'https://github.com/tpope/vim-surround'

Plug 'https://github.com/windwp/nvim-autopairs'

Plug 'https://github.com/mbbill/undotree'
set undodir=~/sync/ok/undodir
set undofile

Plug 'https://github.com/romainl/vim-cool'

Plug 'https://github.com/norcalli/nvim-colorizer.lua'
autocmd BufRead,BufNewFile * :ColorizerAttachToBuffer

Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'
if &diff
  let g:indent_blankline_enabled = v:false
endif
let g:indent_blankline_char = '▏'
let g:indent_blankline_filetype_exclude = [
      \ 'help', 'yaml'
      \]

Plug 'https://github.com/projekt0n/github-nvim-theme'
call plug#end()

syntax enable
set termguicolors

colorscheme github_light

highlight HopNextKey guifg=#24292f guibg=NONE guisp=NONE gui=bold cterm=bold

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})

set cursorline
set cursorlineopt=number

set number relativenumber

set statusline=[\ %F\ %m]\ %y\ %r%h%w%=[\ %<%{getcwd()}\ ]

set list
let &listchars = 'tab:▸ ,trail:·,nbsp:±,extends:❯,precedes:❮'

set wrap linebreak
let &showbreak = '⤷'
set cpo+=n

set tabstop=4 softtabstop=4 noet
set shiftwidth=4
autocmd BufRead,BufNewFile *.cs,*.h,*.cpp,*.scss,*.css,*.html,*.md,*.js,*.zsh,*.sh,zshrc,*.vim setlocal tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType *.md setlocal formatoptions+=tcqj

filetype plugin indent on
set nocompatible
set encoding=UTF-8
set fileformat=unix
set mouse=a
set clipboard=unnamedplus
set autoindent
set smartindent
set autoread
set autowrite
set nobackup
set noswapfile
set lazyredraw
set ttyfast
set nowritebackup
set inccommand=split
set scrolloff=5
set shortmess+=I
set laststatus=3
set hlsearch
set ignorecase
set incsearch
set smartcase
set magic

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zz
nnoremap # #zz

nnoremap + <C-a>
nnoremap - <C-x>

xnoremap < <gv
xnoremap > >gv

map <space> <leader>

map <silent> <Right> <C-w><
map <silent> <Down> <C-W>-
map <silent> <Up> <C-W>+
map <silent> <Left> <C-w>>

noremap <silent> cd. :cd %:h<enter>
noremap <silent> cd :cd<enter>
noremap <silent> cdr :cd %:h<enter>:cd `git rev-parse --show-toplevel`<enter>

vnoremap <silent> <C-j> :m '>+1<enter>gv=gv
vnoremap <silent> <C-k> :m '<-2<enter>gv=gv

imap , ,<c-g>u
imap . .<c-g>u
imap ! !<c-g>u
imap ? ?<c-g>u
imap [ [<c-g>u

imap <S-down> <esc>o
imap <S-up> <esc>O
nnoremap <silent> <S-down> o<esc>
nnoremap <silent> <S-up> O<esc>
nnoremap đ dd<s>

xnoremap <silent> p p:let @+=@0<enter>:let @"=@0<enter>
nnoremap <leader><space> <c-^>

command! RemoveSymbolMAkaWindowsEndline execute "%s/\r//g"

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()

autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction

vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

function! Write_creating_dirs()
    let l:file=expand("%")
    if empty(getbufvar(bufname("%"), '&buftype')) && l:file !~# '\v^\w+\:\/'
        let dir=fnamemodify(l:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
    write
endfunction
command! WriteReatingDirs call Write_creating_dirs()

lua << EOF
require("nvim-treesitter.configs").setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = "all",

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})
EOF
