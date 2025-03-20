vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")
wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
enabled = false,
    },
    presets = {
operators = true,
motions = true,
text_objects = true,
windows = true,
nav = true,
z = true,
g = true,
    },
  },
  win = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  filter = function()
    return true
  end,
  show_help = true,
})