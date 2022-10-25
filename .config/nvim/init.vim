set nocompatible
set number relativenumber
set termguicolors

set wrap!

filetype plugin on
syntax on

hi Normal guibg=NONE ctermbg=NONE

command WQ wq
command Wq wq
command W w
command Q q

call plug#begin('~/.config/nvim/plugged')

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'arcticicestudio/nord-vim', {'as': 'nord'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'scrooloose/nerdtree'
Plug 'elkowar/yuck.vim'

call plug#end()

let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

colorscheme catppuccin
" colorscheme nord

set foldmethod=marker

lua << EOF

require("catppuccin").setup {
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		barbar = true
	}
}

require('lualine').setup {
	options = { theme = "catppuccin" }
}

EOF

