vim.g.mapleader = "\\"

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Save key strokes (now we do not need to press shift to enter command mode)
map({ "n", "x" }, ";", ":")

-- Capitalization
map("i", "<c-u>", "<Esc>viwUea")
map("i", "<c-t>", "<Esc>b~lea")

-- Quitting and Saving
map('n', '<leader>w', '<cmd>wa<cr>', { desc = "Save file" })
map('n', '<leader>q', '<cmd>qa<cr>', { desc = "Quit" })
map('n', '<leader>wq', '<cmd>wqa<cr>', { desc = "Save and quit" })

-- Config
map("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
  silent = true,
  desc = "Reload init.lua",
})

map("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
    silent = true,
    desc = "Open init.lua",
})

-- Undo
map('i', '<C-z>', '<cmd>undo<cr>', { desc = "Undo" })

-- Deleting Without Yanking
map('n', 'D', '"_D', { desc = "Delete to end of line without yanking" })
map('n', 'x', '"_x', { desc = "Delete character without yanking" })
map('v', '<Del>', '"_d', { desc = "Delete selection without yanking" })

-- Selecting All Text
map('n', '<C-a>', 'ggVG', { desc = "Select all text" })
map('i', '<C-a>', '<Esc>ggVG', { desc = "Select all text from insert mode" })
map('v', '<C-a>', '<Esc>ggVG', { desc = "Reselect all text from visual mode" })

-- Clipboard Integration
map('v', '<C-c>', '"+y', { desc = "Copy to system clipboard" })
map('n', '<C-v>', '"+p', { desc = "Paste from system clipboard" })
map('i', '<C-v>', '<C-r>+', { desc = "Paste from system clipboard in insert mode" })
map("n", "<C-v>", "printf('`[%s`]', getregtype()[0])", { -- see https://stackoverflow.com/a/4317090/6064933.
  expr = true,
  desc = "Reselect last pasted area",
})

-- Paste non-linewise text above or below current line
map("n", "<leader>p", "m`o<ESC>p``", { desc = "Paste below current line" }) -- see https://stackoverflow.com/a/1346777/6064933
map("n", "<leader>P", "m`O<ESC>p``", { desc = "Paste above current line" })

-- Navigation in the location and quickfix list
map("n", "[l", "<cmd>lprevious<cr>zv", { silent = true, desc = "Previous location item" })
map("n", "]l", "<cmd>lnext<cr>zv", { silent = true, desc = "Next location item" })

map("n", "[L", "<cmd>lfirst<cr>zv", { silent = true, desc = "First location item" })
map("n", "]L", "<cmd>llast<cr>zv", { silent = true, desc = "Last location item" })

map("n", "[q", "<cmd>cprevious<cr>zv", { silent = true, desc = "Previous qf item" })
map("n", "]q", "<cmd>cnext<cr>zv", { silent = true, desc = "Next qf item" })

map("n", "[Q", "<cmd>cfirst<cr>zv", { silent = true, desc = "First qf item" })
map("n", "]Q", "<cmd>clast<cr>zv", { silent = true, desc = "Last qf item" })

-- Close location list or quickfix list if they are present
map("n", [[\x]], "<cmd>windo lclose <bar> cclose <cr>", { -- see https://superuser.com/q/355325/736190
  silent = true,
  desc = "Close qf and location list",
})

-- Delete a buffer, without closing the window
map("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", { -- see https://stackoverflow.com/q/4465095/6064933
  silent = true,
  desc = "Delete current buffer",
})

map("n", [[\D]], function()
  local buf_ids = vim.api.nvim_list_bufs()
  local cur_buf = vim.api.nvim_win_get_buf(0)

  for _, buf_id in pairs(buf_ids) do
    -- Do not delete unlisted buffers, which may lead to unexpected errors
    if vim.api.nvim_get_option_value("buflisted", { buf = buf_id }) and buf_id ~= cur_buf then
      vim.api.nvim_buf_delete(buf_id, { force = true })
    end
  end
end, {
  desc = "Delete other buffers",
})

-- Insert a blank line below or above current line (do not move the cursor),
map("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", { -- see https://stackoverflow.com/a/16136133/6064933
  expr = true,
  desc = "Insert line below",
})

map("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "Insert line above",
})

-- Move the cursor based on physical lines, not the actual lines.
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "^", "g^")
map("n", "0", "g0")

-- Do not include white space characters when using $ in visual mode,
map("x", "$", "g_") -- see https://vi.stackexchange.com/q/12607/15292

-- Go to start or end of line easier
map({ "n", "x" }, "H", "^")
map({ "n", "x" }, "L", "g_")

-- Continuous visual shifting (does not exit Visual mode), `gv` means to reselect previous visual area
map("x", "<", "<gv") -- see https://superuser.com/q/310417/736190
map("x", ">", ">gv")

-- Searching
map("n", "/", [[/\v]], { desc = "Always search with very magic mode" })

-- Working Directory
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "Change cwd" }) -- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file

-- Terminal Mode Escape
map("t", "<Esc>", [[<c-\><c-n>]])

-- Spell Check Toggle
map("n", "<F11>", "<cmd>set spell!<cr>", { desc = "Toggle spell checking" })
map("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "Toggle spell checking" })

-- Cutting Without Yanking
map("n", "c", '"_c') -- see https://stackoverflow.com/q/54255/6064933
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "c", '"_c')

-- Remove Trailing Spaces
map("n", "<leader><space>", "<cmd>StripWhitespace<cr>", { desc = "Remove trailing spaces" })

-- Yank Entire Buffer
map("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })

-- Cursor Column Toggle
map("n", "<leader>cl", "<cmd>call utils#ToggleCursorCol()<cr>", { desc = "Toggle cursor column" })

-- Move Lines Up and Down
map("n", "<A-k>", '<cmd>call utils#SwitchLine(line("."), "up")<cr>', { desc = "Move line up" })
map("n", "<A-j>", '<cmd>call utils#SwitchLine(line("."), "down")<cr>', { desc = "Move line down" })
map("x", "<A-k>", '<cmd>call utils#MoveSelection("up")<cr>', { desc = "Move selection up" })
map("x", "<A-j>", '<cmd>call utils#MoveSelection("down")<cr>', { desc = "Move selection down" })

-- Paste Without Yanking Selection
map("x", "p", '"_c<Esc>p') -- see https://stackoverflow.com/q/10723700/6064933.

-- Buffer Navigation
map("n", "gb", '<cmd>call buf_utils#GoToBuffer(v:count, "forward")<cr>', { desc = "Go to next buffer" })
map("n", "gB", '<cmd>call buf_utils#GoToBuffer(v:count, "backward")<cr>', { desc = "Go to previous buffer" })

-- Window Navigation
map("n", "<left>", "<c-w>h", { desc = "Move to left window" })
map("n", "<Right>", "<C-W>l", { desc = "Move to right window" })
map("n", "<Up>", "<C-W>k", { desc = "Move to upper window" })
map("n", "<Down>", "<C-W>j", { desc = "Move to lower window" })

-- Text Objects
map({ "x", "o" }, "iu", "<cmd>call text_obj#URL()<cr>", { desc = "URL text object" })
map({ "x", "o" }, "iB", ":<C-U>call text_obj#Buffer()<cr>", { desc = "Buffer text object" })

-- Join Lines Without Moving Cursor
map("n", "J", function()
  vim.cmd([[
      normal! mzJ`z
      delmarks z
    ]])
end, { desc = "Join lines without moving cursor" })

map("n", "gJ", function()
  vim.cmd([[
      normal! mzgJ`z
      delmarks z
    ]])
end, { desc = "Join lines without moving cursor" })

-- Undo Breakpoints for Certain Characters
local undo_ch = { ",", ".", "!", "?", ";", ":" }
for _, ch in ipairs(undo_ch) do
  map("i", ch, ch .. "<c-g>u")
end

-- Insert Mode Shortcuts
map("i", "<A-;>", "<Esc>miA;<Esc>`ii")
map("i", "<C-A>", "<HOME>")
map("i", "<C-E>", "<END>")
map("c", "<C-A>", "<HOME>")
map("i", "<C-D>", "<DEL>")
