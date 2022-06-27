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

Plug 'neovim/nvim-lspconfig'

Plug 'ferrine/md-img-paste.vim'

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

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
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

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags
}
EOF

nnoremap <C-n> :NvimTreeToggle<CR>

nnoremap <C-j> :bprev<CR>                                                                            
nnoremap <C-k> :bnext<CR>

nnoremap <Left> :echo "Use h instead!"<CR>
nnoremap <Right> :echo "Use l instead!"<CR>
nnoremap <Up> :echo "Use k instead!"<CR>
nnoremap <Down> :echo "Use j instead!"<CR>
