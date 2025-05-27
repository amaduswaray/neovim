return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- Disable LSP text
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					-- disable virtual text
					virtual_text = true,

					-- show signs
					signs = true,

					-- delay update diagnostics
					update_in_insert = false,
				})

			-- Setting keybings
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Depricated, .jump() is the new func

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		-- LSP autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- CONFIGURING THE SERVERS

		-- TypeScript
		vim.lsp.enable("ts_ls")
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- PHP
		vim.lsp.enable("intelephense")
		vim.lsp.config("intelephense", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Marksman
		vim.lsp.enable("marksman")
		vim.lsp.config("marksman", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Tailwindcss
		vim.lsp.enable("tailwindcss")
		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Rust
		vim.lsp.enable("rust_analyzer")
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "rust" },
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})

		-- nix
		vim.lsp.enable("rnix")
		vim.lsp.config("rnix", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "nix" },
		})

		-- Swift
		vim.lsp.enable("sourcekit")
		vim.lsp.config("sourcekit", {
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = function(filename, _)
				return util.root_pattern("buildServer.json")(filename)
					or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
					or util.find_git_ancestor(filename)
					or util.root_pattern("Package.swift")(filename)
			end,
		})

		-- Golang
		vim.lsp.enable("gopls")
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
				},
			},
		})

		-- C++
		vim.lsp.enable("clangd")
		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Zig++
		vim.lsp.enable("zls")
		vim.lsp.config("zls", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				client.server_capabilities.signatureHelpProvider = false
				on_attach(client, bufnr)
			end,
		})

		-- Lua
		vim.lsp.enable("lua_ls")
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
