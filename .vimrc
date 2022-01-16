source /etc/vimrc
set nocompatible

let mapleader = ","

" Modern terminal
set encoding=utf-8
set fileencoding=utf-8
set ttyfast
set mouse=a
set fixendofline
set updatetime=1000

" Syntax highlighting
syntax on

" Enable history
set history=10000
set undodir=$HOME/.vim/undo
set undofile
set undolevels=1000000
set undoreload=1000000
set viminfo='10000,%10000,s1024,c,f1,h,r/tmp,n~/.vim/viminfo

" Theming
set t_Co=256
set background=dark
set showcmd
set showmatch
set number
set laststatus=2
set rtp+=/usr/lib/python3.10/site-packages/powerline/bindings/vim
set title
set colorcolumn=80,100,120
highlight ColorColumn ctermbg=lightgrey

" Better searching
set hlsearch
set incsearch
set smartcase

" Show whitespace characters
set list
set listchars=tab:\|_,trail:~,extends:>,precedes:<

" Configure whitespace usage
set softtabstop=2
set shiftwidth=2
set tabstop=2
set noexpandtab

" Commands
nnoremap <silent> <leader><CR> :nohl<CR>
nnoremap <silent> <leader>, :ALENextWrap<CR>
nnoremap <silent> NN o<ESC>

" Jump back to last position
au BufReadPost *
       \ if line("'\"") > 1 && line("'\"") <= line("$")
       \| exe "normal! g`\""
       \| endif

" Global yank/paste
vnoremap <silent> <leader>y :w! /tmp/vim<CR>
vnoremap <silent> <leader>d :w! /tmp/vim<CR>gvd
nnoremap <silent> <leader>p :r /tmp/vim<CR>
