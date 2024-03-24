return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").create_default_mappings()

		-- Suggested keymaps to ovveride s
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
		vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
		vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

		-- Hide the (real) cursor when leaping, and restore it afterwards.
		vim.api.nvim_create_autocmd("User", {
			pattern = "LeapEnter",
			callback = function()
				vim.cmd.hi("Cursor", "blend=100")
				vim.opt.guicursor:append({ "a:Cursor/lCursor" })
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "LeapLeave",
			callback = function()
				vim.cmd.hi("Cursor", "blend=0")
				vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
			end,
		})
	end,
}
