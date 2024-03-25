# AMAVIM

```
  ______  __       __  ______  __     __ ______ __       __
 /      \|  \     /  \/      \|  \   |  \      \  \     /  \
|  ██████\ ██\   /  ██  ██████\ ██   | ██\██████ ██\   /  ██
| ██__| ██ ███\ /  ███ ██__| ██ ██   | ██ | ██ | ███\ /  ███
| ██    ██ ████\  ████ ██    ██\██\ /  ██ | ██ | ████\  ████
| ████████ ██\██ ██ ██ ████████ \██\  ██  | ██ | ██\██ ██ ██
| ██  | ██ ██ \███| ██ ██  | ██  \██ ██  _| ██_| ██ \███| ██
| ██  | ██ ██  \█ | ██ ██  | ██   \███  |   ██ \ ██  \█ | ██
 \██   \██\██      \██\██   \██    \█    \██████\██      \██



```

The Personal vim config of @amaduswaray

As a Norwegian with a Norwegian keyboard, using VIM-motions can be tricky as the `{}` and `[]` keys are locked behind layers.
The result of this was mapping the `ø` and `æ` keys to the coresponding `{}` and `[]` keys, as they are placed similarly to those keys on a traditional US keyboard.

The config takes a lot of inspiration from [LazyVim](https://nvchad.com/) and [NvChad](https://www.lazyvim.org/), utilizing many of the plugins that they provide out of the box.

I would suggest using one of those distros if you are not comfortable maintaining your own nvim-config when it comes to updating packages, and handling errors and such:

# Config

**Folder Structure**

```
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── plugins
    │   ├── Depricated
    │   │   ├── notify.lua
    │   │   └── nvim-tree.lua
    │   ├── Editor
    │   │   ├── bufremove.lua
    │   │   ├── comment.lua
    │   │   ├── commentstring.lua
    │   │   ├── gitsigns.lua
    │   │   ├── illuminate.lua
    │   │   ├── leap.lua
    │   │   ├── mini-pairs.lua
    │   │   ├── nvim-cmp.lua
    │   │   ├── telescope.lua
    │   │   ├── treesitter.lua
    │   │   └── ts-autotag.lua
    │   ├── LSP
    │   │   ├── lspconfig.lua
    │   │   ├── mason.lua
    │   │   └── none-ls.lua
    │   ├── UI
    │   │   ├── bufferline.lua
    │   │   ├── catppuccin.lua
    │   │   ├── dashboard.lua
    │   │   ├── indent-backline.lua
    │   │   ├── indentscope.lua
    │   │   ├── lualine.lua
    │   │   ├── neo-tree.lua
    │   │   └── noice.lua
    │   └── Utils
    │       ├── dressing.lua
    │       ├── lazygit.lua
    │       ├── nui.lua
    │       ├── persistence.lua
    │       ├── plenary.lua
    │       ├── toggleterm.lua
    │       ├── web-devicons.lua
    │       └── which-key.lua
    ├── plugins.lua
    └── vim-options.lua

```

The `init.lua` file consists of the configuration of the [lazy.nvim] packet manager, as well as including the files located in the `lua/` directory.

The first file in the `lua/` directory is `vim-options.lua`.
This file consists of all the vim commands,and the vim settings I prefer. Feel free to play around with these :)

The plugins directory consists of 4 different directories, where I place the plugins that relate to those categories. The `Depricated` directory does not get included in `init.lua`, so if there are plugins you wish to diable, simply move them there.

Adding a new plugin is as simple as creating a new file that returns a lua table. Make sure that this file is placed in the `plugin/` directory, or in of its sub-directories.

Including new sub-directories can be done the `init.lua` file

# Plugins

Here is a list of plugins that are included out of the box:

- [mini.bufremove](https://github.com/echasnovski/mini.bufremove)
- [comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [illuminate.vim](https://github.com/RRethy/vim-illuminate)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [mini.pairs](https://github.com/echasnovski/mini.pairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [catppuccin](https://github.com/catppuccin/nvim)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [indent-backline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [persistence.nvim](https://github.com/folke/persistence.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [which-key](https://github.com/folke/which-key.nvim)

# TODOS

- [x] Implement the UI
- [x] Add LSP support
- [x] Add autoformatting
- [x] Create dashboard
- [ ] Creat easy theme switching
- [ ] Add padding between bufferline and code
- [ ] Refactor `lua/vim-option.lua` to multiple files
- [ ] Update `README.md` with key-bindings section
- [ ] Update `README.md` with plugin descriptions
