return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		code = {
			-- Turn on / off code block & inline code rendering
			enabled = true,
			-- Turn on / off any sign column related rendering
			sign = true,
			-- Determines how code blocks & inline code are rendered:
			--  none:     disables all rendering
			--  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
			--  language: adds language icon to sign column if enabled and icon + name above code blocks
			--  full:     normal + language
			style = "full",
			-- Determines where language icon is rendered:
			--  right: right side of code block
			--  left:  left side of code block
			position = "left",
			-- Amount of padding to add around the language
			-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
			language_pad = 0,
			-- Whether to include the language name next to the icon
			language_name = true,
			-- A list of language names for which background highlighting will be disabled
			-- Likely because that language has background highlights itself
			disable_background = { "diff" },
			-- Width of the code block background:
			--  block: width of the code block
			--  full:  full width of the window
			width = "full",
			-- Amount of margin to add to the left of code blocks
			-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
			-- Margin available space is computed after accounting for padding
			left_margin = 0,
			-- Amount of padding to add to the left of code blocks
			-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
			left_pad = 0,
			-- Amount of padding to add to the right of code blocks when width is 'block'
			-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
			right_pad = 0,
			-- Minimum width to use for code blocks when width is 'block'
			min_width = 0,
			-- Determins how the top / bottom of code block are rendered:
			--  thick: use the same highlight as the code body
			--  thin:  when lines are empty overlay the above & below icons
			border = "thin",
			-- Used above code blocks for thin border
			above = "▄",
			-- Used below code blocks for thin border
			below = "▀",
			-- Highlight for code blocks
			highlight = "RenderMarkdownCode",
			-- Highlight for inline code
			highlight_inline = "RenderMarkdownCodeInline",
			-- Highlight for language, overrides icon provider value
			highlight_language = nil,
		},
		latex = {
			-- Whether LaTeX should be rendered, mainly used for health check
			enabled = true,
			-- Executable used to convert latex formula to rendered unicode
			converter = "latex2text",
			-- Highlight for LaTeX blocks
			highlight = "RenderMarkdownMath",
			-- Amount of empty lines above LaTeX blocks
			top_pad = 0,
			-- Amount of empty lines below LaTeX blocks
			bottom_pad = 0,
		},
		pipe_table = {
			-- Turn on / off pipe table rendering
			enabled = true,
			-- Pre configured settings largely for setting table border easier
			--  heavy:  use thicker border characters
			--  double: use double line border characters
			--  round:  use round border corners
			--  none:   does nothing
			preset = "none",
			-- Determines how the table as a whole is rendered:
			--  none:   disables all rendering
			--  normal: applies the 'cell' style rendering to each row of the table
			--  full:   normal + a top & bottom line that fill out the table when lengths match
			style = "full",
			-- Determines how individual cells of a table are rendered:
			--  overlay: writes completely over the table, removing conceal behavior and highlights
			--  raw:     replaces only the '|' characters in each row, leaving the cells unmodified
			--  padded:  raw + cells are padded to maximum visual width for each column
			--  trimmed: padded except empty space is subtracted from visual width calculation
			cell = "padded",
			-- Amount of space to put between cell contents and border
			padding = 1,
			-- Minimum column width to use for padded or trimmed cell
			min_width = 0,
        -- Characters used to replace table border
        -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
        -- stylua: ignore
        border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
        },
			-- Gets placed in delimiter row for each column, position is based on alignmnet
			alignment_indicator = "━",
			-- Highlight for table heading, delimiter, and the line above
			head = "RenderMarkdownTableHead",
			-- Highlight for everything else, main table rows and the line below
			row = "RenderMarkdownTableRow",
			-- Highlight for inline padding used to add back concealed space
			filler = "RenderMarkdownTableFill",
		},
	},
	config = function()
		require("obsidian").get_client().opts.ui.enable = false
		vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()["ObsidianUI"], 0, -1)
		require("render-markdown").setup(opts)
	end,
}
