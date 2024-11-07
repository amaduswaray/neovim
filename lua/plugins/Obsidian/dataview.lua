return {
	"hisbaan/dataview.nvim",
	-- only load dataview.nvim for files in your obsidian vault
	event = {
		"BufEnter "
			.. vim.fn.expand("~")
			.. "/Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO**",
	},
	-- configuration here, see below for full configuration options
	opts = {
		vault_dir = "/Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO",
		buffer_type = "tab", -- float | split | vsplit | tab
	},
	-- config = function()
	-- 	require("dataview").setup(opts)
	-- end,
}
