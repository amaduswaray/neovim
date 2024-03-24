return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				container = {
					enable_character_fade = false,
				},
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "▹",
					expander_expanded = "▿",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					default = "",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						modified = "",
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "◌",
						unstaged = "!",
						staged = "✓",
						conflict = "",
					},
				},
				window = {
					position = "left",
					width = 40,
				},
			},
		})
		-- Keymaps
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal left toggle<CR>")
	end,
}
