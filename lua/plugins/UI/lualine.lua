return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Personal amavim theme colors
		local colors = {
			blue = "#80a0ff",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#d183e8",
			green = "#A6E3A1",
			orange = "#FAB387",
			grey = "#353442",
			pink = "#F5C2E7",
			transparant = "#1E1E2F",
		}

		local amavim = {
			normal = {
				a = { fg = colors.black, bg = colors.pink, gui = "bold" },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.transparant },
			},
			command = {
				a = { fg = colors.black, bg = colors.orange, gui = "bold" },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.transparant },
			},

			terminal = {
				a = { fg = colors.black, bg = colors.violet, gui = "bold" },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.transparant },
			},

			insert = { a = { fg = colors.black, bg = colors.green, gui = "bold" } },
			visual = { a = { fg = colors.black, bg = colors.blue, gui = "bold" } },
			replace = { a = { fg = colors.black, bg = colors.red, gui = "bold" } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white, bg = colors.transparant },
			},
		}

		-- function for progress symbol
		local function prog()
			return [[]]
		end

		-- Funtion to get lsp
		local function lsp()
			local msg = "NONE"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in pairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end

		require("lualine").setup({
			options = {
				theme = amavim,
				component_separators = "",
				-- section_separators = { left = "█", right = " " },
				section_separators = { left = "", right = " " },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
				},
			},
			sections = {
				-- lualine_a = { { "mode", separator = { left = "█" }, right_padding = 2, icon = "" } },
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2, icon = "" } },

				lualine_b = {
					{
						"filename",
						icon = "󰉋",
						file_status = true,
						newfile_status = true,
						path = 4,
						symbols = { modified = "", readonly = "󰈚", unnamed = "", newfile = "" },
					},
				},

				lualine_c = {
					{ "filetype", colored = true, icon_only = true },
					{ "branch", icon = "" },
					{ "diagnostics" },
				},

				lualine_x = {
					{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
					{ lsp, icon = "  LSP ~" },
					{ "location" },
				},

				lualine_y = {
					-- { prog, padding = { left = 0, right = 1 }, separator = { left = "█" } },
					{ prog, padding = { left = 0, right = 1 }, separator = { left = "" } },
				},

				lualine_z = {
					-- { "progress", separator = { right = "█" }, padding = { left = 1, right = 1 } },
					{ "progress", separator = { right = "" }, padding = { left = 1, right = 1 } },
				},
			},
			winbar = {},
			tabline = {},
			extensions = { "lazy" },
		})
	end,
}
