vim.g.mapleader = ','

-- Modern terminal
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.ttyfast = true
vim.opt.mouse = 'a'
vim.opt.fixendofline = true
vim.opt.updatetime = 100

-- Enable history
vim.opt.history = 10000
vim.opt.undodir = vim.env.HOME .. '/.nvim/undo'
vim.opt.undofile = true
vim.opt.undolevels = 1000000
vim.opt.undoreload = 1000000
vim.opt.viminfo = "'10000,%10000,s1024,c,f1,h,r/tmp,n~/.nvim/viminfo"

-- Theming
vim.opt.background = 'dark'
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.laststatus = 2

vim.opt.title = true
vim.opt.colorcolumn = { 80, 100, 120 }
vim.cmd [[
	syntax on
	filetype plugin indent on
	highlight ColorColumn ctermbg=lightgrey
]]

-- Better searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '|_', trail = '~', extends = '>', precedes = '<' }

-- Configure whitespace usage
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false

-- Plugins

vim.g.ale_disable_lsp = 1

local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'dense-analysis/ale'
-- Plug('neoclide/coc.nvim', { branch = 'release' })

Plug 'rust-lang/rust.vim'
Plug 'vim-crystal/vim-crystal'

Plug 'gpanders/editorconfig.nvim'

vim.call('plug#end')

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = "powerline",
	}
}

-- Rust support
vim.g.ale_linters = {
	rust = { 'analyzer', 'cargo', 'rls', 'rustc' }
}
vim.g.ale_fixers = {
	rust = { 'rustfmt', 'trim_whitespace', 'remove_trailing_lines' }
}

-- Enable auto-complete
vim.o.completeopt = 'menu,menuone,preview,noselect,noinsert'
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_column_always = 1
vim.g.ale_completion_enabled = 1

vim.cmd [[
	nnoremap <C-Return> :ALEGoToDefinition<CR>
]]
