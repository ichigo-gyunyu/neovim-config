local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
  },
})

vim.keymap.set({ "n", "v" }, "<M-F>", function()
  conform.format({ lsp_format = "fallback" })
end, { silent = true, desc = "Format buffer" })
