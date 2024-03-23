return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = true,
  cmd = { "ToggleTerm"},
  keys = {
    {
      "<leader>ft",
      function()
        local count = vim.count1
        require("toggleterm").toggle(count, 0, "float")
      end,
      desc = "Toggle Terminal",
    },
  },
  config = function()
    
    -- Setting up config
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-7>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_mode = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

--     vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

--     local Terminal = require("toggleterm.terminal").Terminal
--     local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--     function _lazygit_toggle()
--       lazygit:toggle()
--     end

--     vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true}) local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
  end,
}