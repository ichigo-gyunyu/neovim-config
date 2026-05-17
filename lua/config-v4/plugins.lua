local plugins = {
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/romgrk/barbar.nvim" },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1"),
  },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/zbirenbaum/copilot.lua" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/leisurelicht/lualine-copilot.nvim" },
  {
    src = "https://github.com/lewis6991/gitsigns.nvim",
    version = vim.version.range("2"),
  },
  {
    src = "https://github.com/nvim-mini/mini.nvim",
    version = "stable",
  },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
}

vim.pack.add(plugins)

require("config-v4.plugins.colorscheme")
require("config-v4.plugins.barbar")
require("config-v4.plugins.blink")
require("config-v4.plugins.conform")
require("config-v4.plugins.mason")
require("config-v4.plugins.copilot")
require("config-v4.plugins.lualine")
require("config-v4.plugins.gitsigns")
require("config-v4.plugins.mini")
require("config-v4.plugins.snacks")
require("config-v4.plugins.treesitter")
