return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "c_sharp", "rust", "xml", "yaml" },
  },
  main = "nvim-treesitter.configs",
}
