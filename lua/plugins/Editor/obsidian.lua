return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown", -- Activate this and remove event if you want the plugin to apply to all md files
	event = {
		"BufReadPre /Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO/*.md",
		"BufNewFile /Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "UiO",
				path = "/Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO",
			},
		},
		daily_notes = {
			folder = "/Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO/Z - Daily Notes",
			date_format = "%Y-%m-%d",
			template = "Templates/Daily.md",
		},
		templates = {
			foler = "/Users/amaduswaray/Library/Mobile Documents/iCloud~md~obsidian/Documents/UiO/Templates/",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		mappings = {
			-- Toogle check-boxes
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true, desc = "Obsidian Toggle Checkbox" },
			},
			-- Create new daily Notes
			["<leader>cd"] = {
				action = function()
					return require("obsidian").util.today()
				end,
				opts = { buffer = false, desc = "Obsidian Daily Note Today" },
			},
			["<leader>ct"] = {
				action = function()
					return require("obsidian").util.template()
				end,
				opts = { buffer = true, desc = "Obsidian Insert Template" },
			},
		},
		-- Remove the metadata formatting from the plugin
		---@return table
		note_frontmatter_func = function(note)
			local out = {}

			return out
		end,
	},
}
