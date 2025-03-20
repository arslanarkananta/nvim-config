require('hop').setup({
	keys = 'etovxqpdygfblzhckisuran',
	jump_on_sole_occurrence = true,
	case_insensitive = true,
})

local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader>hw', function()
	hop.hint_words()
end, { desc = "Hop to word" })

vim.keymap.set('n', '<leader>hl', function()
	hop.hint_lines()
end, { desc = "Hop to line" })

vim.keymap.set('n', '<leader>hc', function()
	hop.hint_char1()
end, { desc = "Hop to character" })

vim.keymap.set('n', '<leader>hp', function()
	hop.hint_patterns()
end, { desc = "Hop to pattern" })

vim.keymap.set('n', 'f', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('n', 'F', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('n', 't', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

vim.keymap.set('n', 'T', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })