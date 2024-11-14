return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	keys = {
		{
			"<leader>cd",
			"<cmd>ObsidianToday<cr>",
			desc = "Obsidian Daily Note Today",
		},
		{ "<leader>ct", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian Insert Template" },
	},
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
			folder = "Z - Daily Notes",
			date_format = "%Y-%m-%d",
			template = "Templates/Daily.md",
		},
		templates = {
			folder = "Templates",
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
		},
		-- Remove the metadata formatting from the plugin
		disable_frontmatter = true,
		---@return table
		note_frontmatter_func = function(note)
			local out = {}
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,
	},
}
