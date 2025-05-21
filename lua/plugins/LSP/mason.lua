return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- custom UI icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = " ",
					package_uninstalled = "✗",
				},
			},
		})

		-- setup LSPs
		mason_lspconfig.setup({
			-- list of servers that must be installed
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"rust_analyzer",
				"elixirls",
				"gopls",
				"marksman",
				"intelephense",
				"tailwindcss",
				"rnix",
				"clangd",
				"zls",
			},

			-- Auto install configured servers
			automatic_installation = true,
		})
	end,
}
