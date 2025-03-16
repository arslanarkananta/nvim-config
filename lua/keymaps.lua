vim.g.mapleader = "\\"

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<leader>w', '<cmd>w<cr>', { desc = "Save file" })
map('n', '<leader>q', '<cmd>q<cr>', { desc = "Quit" })
map('n', '<leader>wq', '<cmd>wq<cr>', { desc = "Save and quit" })
map('n', '<leader>z', '<cmd>undo<cr>', { desc = "Undo" })
