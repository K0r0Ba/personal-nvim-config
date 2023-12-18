:set number relativenumber

call plug#begin('~/.config/nvim')

Plug 'nvim-tree/nvim-web-devicons'

Plug 'nvim-lualine/lualine.nvim'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'eandrju/cellular-automaton.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'ellisonleao/gruvbox.nvim'

Plug 'williamboman/mason.nvim'

Plug 'williamboman/mason-lspconfig.nvim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
call plug#end()

lua << END

require('lualine').setup()
require('toggleterm').setup()
require('gruvbox').setup()
require("mason").setup()
require("mason-lspconfig").setup()

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
END

lua require('init')

:colorscheme gruvbox
