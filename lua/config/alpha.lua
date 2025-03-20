local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"", "", "", "", "",
	"                                                                     ",
	"       ████ ██████           █████      ██                     ",
	"      ███████████             █████                             ",
	"      █████████ ███████████████████ ███   ███████████   ",
	"     █████████  ███    █████████████ █████ ██████████████   ",
	"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
	"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
	" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
	"", "", "", "", "",
}

dashboard.section.buttons.val = {
	dashboard.button("r", "⌛  Recent files", ":Telescope oldfiles<CR>"),
	dashboard.button("f", "🔎  Find file", ":Telescope find_files<CR>"),
	dashboard.button("g", "🔍  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("c", "🔧  Configuration", ":e $MYVIMRC<CR>"),
	dashboard.button("q", "🚪  Quit", ":qa<CR>"),
}

local function get_plugin_count()
	return require("lazy").stats().count
end

local startup_time = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time or vim.fn.reltime()))
local startup_time_ms = math.floor(startup_time * 1000)

dashboard.section.footer.val = {
	"",
	"Neovim loaded " .. get_plugin_count() .. " plugins in " .. startup_time_ms .. " ms",
	"",
}

require('alpha').setup(dashboard.opts)
