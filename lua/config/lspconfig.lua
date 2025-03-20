require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "pyright", "ts_ls", "clangd" },
  automatic_installation = true,
})

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
end

-- Lua LS
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
diagnostics = {
  globals = { "vim" },
},
    },
  },
})

-- Python ls (pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
})

-- Typescript ls
lspconfig.ts_ls.setup({
  on_attach = on_attach,
})

-- C/C++ ls (clangd)
lspconfig.clangd.setup({
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
  },
})

-- See available language servers by going to
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md