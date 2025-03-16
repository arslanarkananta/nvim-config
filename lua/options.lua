vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'

vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true

vim.o.encoding = 'UTF-8'
vim.o.guifont = 'FiraCode Nerd Font:h11'
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.foldenable = true

if vim.fn.has('win32') == 1 then
  vim.g.clipboard = {
    name = 'windows-clipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end