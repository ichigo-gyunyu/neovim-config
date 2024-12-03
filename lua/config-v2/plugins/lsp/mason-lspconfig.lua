return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      -- "gopls",
      "jsonls",
      "lemminx",
      "lua_ls",
      -- "omnisharp",
      "rust_analyzer",
    },
  },
}
