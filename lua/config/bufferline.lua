require("bufferline").setup {
	options = {
		mode = "tabs",
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		custom_filter = function(buf_number)
			if vim.bo[buf_number].filetype ~= "qf" then
				return true
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
				padding = 1
			}
		},
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
	},
}

-- Bufferline keymaps
vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })

-- Hide tabline when alpha is open
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.opt.showtabline = 0
	end
})

-- Show tabline when alpha is closed
vim.api.nvim_create_autocmd("BufUnload", {
	pattern = "<buffer>",
	callback = function()
		vim.opt.showtabline = 2
	end
})