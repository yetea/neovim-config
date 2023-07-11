local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'https://gitlab.com/__tpb/monokai-pro.nvim',
  'nvim-treesitter/nvim-treesitter',
  'luisiacc/gruvbox-baby',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' }, -- Required
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    }
  },
  'nvim-lualine/lualine.nvim',
  'jose-elias-alvarez/typescript.nvim',
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  { 'gelguy/wilder.nvim',
    config = function()
      local wilder = require('wilder')
      wilder.setup({
        modes = { ":", "/", "?" },
      })
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline(),
          wilder.search_pipeline()
        ),
      })
      wilder.set_option('renderer', wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }))
    end,
  },
  "lukas-reineke/indent-blankline.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
  -- Show colors
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
