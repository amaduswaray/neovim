return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		end

		local nvimtree = require("nvim-tree")
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		-- change color for arrows in tree to light blue
		--vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		--vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
		-- configure nvim-tree
		nvimtree.setup({
			on_attach = my_on_attach,
			hijack_cursor = true,
			git = {
				ignore = false,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			view = {
				width = 35,
			},
			renderer = {
				highlight_git = true,
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = " ",
						symlink = "",
						bookmark = "◉",
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							deleted = "",
							untracked = "?",
							ignored = "",
						},
						folder = {
							default = "",
							open = "",
							symlink = "",
						},
					},
					show = {
						git = true,
						file = true,
						folder = true,
						folder_arrow = true,
					},
				},
				indent_markers = {
					enable = true,
				},
			},
		})
		-- set keymaps
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		vim.keymap.set(
			"n",
			"<leader>E",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		-- vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		-- vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
