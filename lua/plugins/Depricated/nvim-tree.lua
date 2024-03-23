 return {
   "nvim-tree/nvim-tree.lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
     local nvimtree = require("nvim-tree")
     -- recommended settings from nvim-tree documentation
     vim.g.loaded_netrw = 1
     vim.g.loaded_netrwPlugin = 1
     -- change color for arrows in tree to light blue
     vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
     vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
     -- configure nvim-tree
     nvimtree.setup({
       view = {
         width = 35,
         relativenumber = true,
       },
       -- change folder arrow icons
       renderer = {
         indent_markers = {
           enable = false,
         },
         icons = {
           glyphs = {
             folder = {
               arrow_closed = "", -- arrow when folder is closed
               arrow_open = "", -- arrow when folder is open
             },
           },
         },
       },
       -- disable window_picker for
       -- explorer to work well with
       -- window splits
       actions = {
         open_file = {
           window_picker = {
             enable = false,
           },
         },
       },
       filters = {
         custom = { ".DS_Store" },
       },
       git = {
         ignore = true,
       },
     })
     -- set keymaps
     vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
     vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
     -- vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
     -- vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
   end,
 }

