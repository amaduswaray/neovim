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
			pink = "#FF6C93",
		}

		local amavim = {
			normal = {
				a = { fg = colors.black, bg = colors.pink },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},
			command = {
				a = { fg = colors.black, bg = colors.orange },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},

			terminal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white },
			},

			insert = { a = { fg = colors.black, bg = colors.green } },
			visual = { a = { fg = colors.black, bg = colors.blue } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white },
			},
		}

		-- function for progress symbol
		local function prog()
			return [[ ]]
		end

		-- Funtion to get lsp
		local function lsp()
			local msg = "NONE"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
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
				section_separators = { left = "", right = " " },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter", "neo-tree" },
				},
			},
			sections = {
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
					{ "filetype", colored = false, icon_only = true },
				},

				lualine_c = { "branch", "diagnostics" },

				lualine_x = {
					{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
					{ lsp, icon = "  LSP ~" },
				},

				lualine_y = {
					{ prog, padding = { left = 0, right = 1 }, separator = { left = "" } },
				},

				lualine_z = {
					{ "progress", separator = { right = "" }, padding = { left = 1, right = 1 } },
				},
			},
			winbar = {},
			tabline = {},
			extensions = { "lazy", "neo-tree" },
		})
	end,
}
