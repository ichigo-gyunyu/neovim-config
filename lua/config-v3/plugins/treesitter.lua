return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  opts = {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
    -- indent = { enable = true },
    -- incremental_selection = { enable = true },
  },
  main = "nvim-treesitter.configs",
}
