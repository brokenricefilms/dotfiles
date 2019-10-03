call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            

set nu

set clipboard=unnamedplus

syntax off 

set mouse=a

set autoread
set autowrite

set nobackup
set nowb
set noswapfile

set ts=4 sw=4

let g:user_emmet_leader_key=','

let g:airline_theme='minimalist'

:imap jj <Esc>

nmap <silent> f <Plug>(easymotion-overwin-f)
nmap <silent> F <Plug>(easymotion-overwin-line)

nnoremap <C-o> :CocList outline<CR>
