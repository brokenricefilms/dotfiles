set nu relativenumber
set clipboard=unnamedplus
syntax on
syntax enable
set mouse=a
set autoread
set autowrite
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

call plug#begin('~/.config/nvim/plugged')
call plug#end()

:imap jj <Esc>
