return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
      -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = { Error = " ", Warn = " ", Hint = " ", Info = " " }
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						-- text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
						-- separator = true,
					},
				},
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
					bufferline.style_preset.minimal,
				},
			},
		})
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
