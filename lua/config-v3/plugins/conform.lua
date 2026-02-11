return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<M-F>",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format Buffer",
    },
  },
  version = "*",
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
      json = { "jq" },
      lua = { "stylua" },
      python = { "black" },
      xml = { "xmlformat" },
      yaml = { "yamlfmt" },
    },
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
