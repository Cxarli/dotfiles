lua require('init')

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
vnoremap <silent> <leader>y :w! /tmp/nvim<CR>
vnoremap <silent> <leader>d :w! /tmp/nvim<CR>gvd
nnoremap <silent> <leader>p :r /tmp/nvim<CR>
