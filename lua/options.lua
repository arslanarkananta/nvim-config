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

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.signcolumn = "yes"
vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]

vim.o.clipboard = "unnamedplus"
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
elseif vim.fn.has('macunix') == 1 then
  if vim.fn.executable('pbcopy') == 0 or vim.fn.executable('pbpaste') == 0 then
    vim.notify("pbcopy or pbpaste not found. Clipboard might not work properly.", vim.log.levels.WARN)
  end
elseif vim.fn.has('unix') == 1 then
  if vim.fn.executable('xclip') == 1 then
    vim.g.clipboard = {
      name = 'xclip-clipboard',
      copy = {
        ['+'] = 'xclip -selection clipboard',
        ['*'] = 'xclip -selection clipboard',
      },
      paste = {
        ['+'] = 'xclip -selection clipboard -o',
        ['*'] = 'xclip -selection clipboard -o',
      },
      cache_enabled = 0,
    }
  elseif vim.fn.executable('wl-copy') == 1 and vim.fn.executable('wl-paste') == 1 then
    vim.g.clipboard = {
      name = 'wayland-clipboard',
      copy = {
        ['+'] = 'wl-copy',
        ['*'] = 'wl-copy',
      },
      paste = {
        ['+'] = 'wl-paste',
        ['*'] = 'wl-paste',
      },
      cache_enabled = 0,
    }
  end
end