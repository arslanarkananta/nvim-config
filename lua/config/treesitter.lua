require('nvim-treesitter.configs').setup({
	ensure_installed = { "c", "lua", "python", "javascript", "typescript", "rust", "markdown" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})