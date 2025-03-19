-- Display and ui settings
vim.o.number = true          -- Show absolute line numbers
vim.o.relativenumber = true  -- Show relative line numbers for easier navigation
vim.o.mouse = 'a'            -- Enable mouse support in all modes ('a' means all modes)

-- Indentation and formating
vim.o.autoindent = true      -- Copy indent from current line when starting a new line
vim.o.tabstop = 2            -- Number of spaces a <Tab> counts for
vim.o.softtabstop = 2        -- Number of spaces a <Tab> counts for when editing
vim.o.shiftwidth = 2         -- Number of spaces for each step of autoindent
vim.o.smarttab = true        -- <Tab> inserts blanks according to 'shiftwidth'

-- Colors and fonts
vim.o.encoding = 'UTF-8'                   -- Set the character encoding
vim.o.guifont = 'FiraCode Nerd Font:h11'   -- Set GUI font (for GUIs like Neovide)
vim.o.termguicolors = true                 -- Enable true color support in terminal

-- Code folding
vim.o.foldmethod = 'expr'                      -- Use expression-based folding
vim.o.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Treesitter for folding
vim.o.foldlevelstart = 99                      -- Start with all folds open
vim.o.foldenable = true                        -- Enable folding

-- Sidebar and visual elements
vim.o.signcolumn = "yes"     -- Always show the sign column (for git signs, diagnostics, etc.)
vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]  -- Configure special display characters

-- System clipboard integration
vim.o.clipboard = "unnamedplus"  -- Use system clipboard by default

if vim.fn.has('win32') == 1 then
  vim.g.clipboard = {
    name = 'windows-clipboard',  -- Windows clipboard configuration
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
    vim.notify("pbcopy or pbpaste not found. Clipboard might not work properly.", vim.log.levels.WARN)  -- macOS clipboard warning
  end
elseif vim.fn.has('unix') == 1 then
  if vim.fn.executable('xclip') == 1 then
    vim.g.clipboard = {
      name = 'xclip-clipboard',  -- X11 clipboard configuration using xclip
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
      name = 'wayland-clipboard',  -- Wayland clipboard configuration
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