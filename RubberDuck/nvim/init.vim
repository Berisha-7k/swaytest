" Vim-Plug kurulumu (init.vim kullanarak)
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'goolord/alpha-nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

colorscheme nord
set number
set termguicolors
set relativenumber
syntax on

autocmd VimEnter * NvimTreeToggle
autocmd BufRead,BufNewFile * :ColorizerAttachToBuffer

" Colorizer'ı başlat
lua << EOF
require('colorizer').setup()
EOF

" Treesitter başlat
lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  }
}
EOF

" Indent-Blankline başlat
lua << EOF
require("ibl").setup {}
EOF

" Gitsigns başlat
lua << EOF
require('gitsigns').setup()
EOF

" Nvim-compe yapılandırması (opsiyonel ama faydalı)
lua << EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
  };
}
EOF

" nvim-tree başlat
lua << EOF
require("nvim-tree").setup()
EOF


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
