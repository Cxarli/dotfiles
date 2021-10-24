" source /usr/share/vim/vimrc
source /etc/vimrc
set nocompatible

" Plugins
execute pathogen#infect()

" Extra stuff
let mapleader = ","
set updatetime=1000

" Plugin: Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Plugin: rust.vim
" let g:rustfmt_autosave = 1

" Plugin: YouCompleteMe
" let g:ycm_auto_trigger = 1
" nmap <leader>m <plug>(YCMHover)

" Modern terminal
set encoding=utf-8
set fileencoding=utf-8
set ttyfast
set mouse=a
set fixendofline

" Dvorak cursor movement on bottom left
" noremap ; h
" noremap q j
" noremap j k
" noremap k l


" Syntax higlighting
syntax on
filetype plugin indent on

" Enable history
set history=10000
set undodir=$HOME/.vim/undo
set undofile
set undolevels=1000000
set undoreload=1000000

" < is unset to store all lines
" c : convert file from old encoding to new encoding
" f : store file marks
" h : disable hlsearch when reloading
" r : don't store for files in /tmp
set viminfo='1000,%1000,s1024,c,f1,h,r/tmp,n~/.vim/viminfo

" Theming
colorscheme delek
set background=dark
set showcmd " Show commands as you type them
set showmatch " Show matching brackets
set number " Show line numbers
set laststatus=2 " Always show status line
set title " Have vim set the terminal title
highlight Pmenu ctermbg=white

" Show rulers at 80,100,120 cols
set colorcolumn=80,100,120
highlight ColorColumn ctermbg=lightgrey

" Better searching
set hlsearch " Highlight search matches
set incsearch " Highlight while searching
set ignorecase " Match case-insensitively (use \c or \C to override)
set smartcase " Match case-sensitively if there are uppercase chars

" Show whitespace characters
set list
set listchars=space:·,tab:├─╴,trail:~,extends:>,precedes:<
" a
" 	b
" 		c
" 			d
"       a
   "    a   b

highlight Space ctermfg=black guifg=black
highlight LeadingSpace ctermfg=white guifg=white
call matchadd('Space', ' \+')
call matchadd('LeadingSpace', '^ \+')
call matchadd('LeadingSpace', '  \+')

" Use hard tabs of 2 spaces wide
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
" set smarttab

" Disable highlighting
nnoremap <silent> <leader><CR> :nohl<CR>
" Go to next warning
nnoremap <silent> <leader>, :ALENext<CR>
" Add a newline
nnoremap NN o<ESC>

" Jump back to last position
au BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$")
	\| exe "normal! g`\""
	\| endif
