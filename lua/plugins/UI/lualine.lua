return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter", "neo-tree" },
				},
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = { "branch" },

				lualine_c = { "filename" },
				lualine_x = {
					{ "location", padding = { left = 1, right = 1 } },
				},
				lualine_y = {
					{ "progress", separator = " ", icon = "", padding = { left = 1, right = 1 } },
				},
				lualine_z = {
					{ "filetype", icon_only = false, separator = "", padding = { left = 1, right = 2 } },
				},
			},
			winbar = {},
			tabline = {},
			extensions = { "lazy", "neo-tree" },
		})
	end,
}


