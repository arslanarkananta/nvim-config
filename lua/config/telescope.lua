require('telescope').setup({
	defaults = {
		file_ignore_patterns = {".git/", "node_modules/", "%.log"},
		prompt_prefix = "🔍 ",
		color_devicons = true,
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	}
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', function() require('telescope').extensions.file_browser.file_browser() end, { desc = "File browser" })
vim.keymap.set('n', '<leader>fr', telescope.oldfiles, { desc = "Recent files" })