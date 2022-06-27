call plug#begin()

Plug 'joshdick/onedark.vim'

Plug 'itchyny/lightline.vim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'airblade/vim-gitgutter'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'sheerun/vim-polyglot'

Plug 'ixru/nvim-markdown'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set rnu
syntax on
colorscheme onedark

let g:gitgutter_map_keys = 0
let g:lightline = {'colorscheme': 'onedark'}
let g:lightline.enable = {'tabline' : 0}
let g:vim_markdown_math = 1


lua << EOF
require("nvim-tree").setup()
require("bufferline").setup { options = {
	separator_style = "slant",
	show_buffer_close_icons = false,
	show_close_icons = false,
	color_icons = true,
	show_buffer_icons = true
	} 
}
EOF

nnoremap <C-n> :NvimTreeToggle<CR>

nnoremap <C-j> :bprev<CR>                                                                            
nnoremap <C-k> :bnext<CR>

nnoremap <Left> :echo "Use h instead!"<CR>
nnoremap <Right> :echo "Use l instead!"<CR>
nnoremap <Up> :echo "Use k instead!"<CR>
nnoremap <Down> :echo "Use j instead!"<CR>

