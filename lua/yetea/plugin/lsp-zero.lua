local lsp = require("lsp-zero").preset({})

require("luasnip/loaders/from_vscode").lazy_load()

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  lsp.buffer_autoformat()
end)
local cmp = require("cmp")

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" },  -- snippets
    { name = "buffer" },   -- text within current buffer
    { name = "path" },     -- file system paths
  }),
})


-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.skip_server_setup({ 'tsserver', 'eslint' })

lsp.setup()

require('typescript').setup({
  server = {
    on_attach = function(client, bufnr)
      -- You can find more commands in the documentation:
      -- https://github.com/jose-elias-alvarez/typescript.nvim#commands

      vim.keymap.set('n', '<leader>mi', '<cmd>TypescriptAddMissingImports<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>oi', '<cmd>TypescriptOrganizeImports<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>ru', '<cmd>TypescriptRemoveUnused<cr>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rf', '<cmd>TypescriptRenameFile<cr>', { buffer = bufnr })
    end
  }
})
