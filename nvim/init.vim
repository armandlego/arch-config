call plug#begin()
" Theme
Plug 'joshdick/onedark.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Tab/Buffer line
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Git pluging
Plug 'airblade/vim-gitgutter'

" File tree and icons 
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

" Syntax
Plug 'sheerun/vim-polyglot'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set nu
syntax on
colorscheme onedark

let g:gitgutter_map_keys = 0

let g:lightline = {'colorscheme': 'onedark'}
let g:lightline.enable = {'tabline' : 0}

set conceallevel=2
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 1

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
nnoremap <C-d> :bd<CR>
nnoremap <C-k> :bnext<CR>

nnoremap <Left> :echo "Use h instead!"<CR>
nnoremap <Right> :echo "Use l instead!"<CR>
nnoremap <Up> :echo "Use k instead!"<CR>
nnoremap <Down> :echo "Use j instead!"<CR>
