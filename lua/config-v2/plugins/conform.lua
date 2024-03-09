return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format Buffer",
    },
  },
  version = "*",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
