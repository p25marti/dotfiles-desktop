set laststatus=2
set t_Co=256
set nocp 
set noshowmode

syntax on 
filetype plugin indent on
set number
set relativenumber
set tabstop=4 shiftwidth=2 expandtab
set shiftwidth=4 "ensures that indent, >>, moves 4 spaces"
colorscheme molokai
set colorcolumn=90
set foldmethod=indent "adds a fold for every block of code that is indented"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ":t"

let mapleader = ";"
nm <C-j> :bnext<CR>
nm <C-k> :bprevious<CR>

"The following is a list Plug commands for managing Vim plugins.
call plug#begin('~/.vim/plugged')

"For adding commands that copy selections to X clipboard"
"Use 'cp' to yank into system clipboard. For example, use cp when in visual
"selection mode to yank selection into system clipboard
Plug 'christoomey/vim-system-copy'

Plug 'vim-airline/vim-airline'

Plug 'jonathanfilip/lucius'

Plug 'elixir-editors/vim-elixir'

call plug#end()
