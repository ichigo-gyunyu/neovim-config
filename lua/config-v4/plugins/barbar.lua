vim.g.barbar_auto_setup = false

require("barbar").setup({
  animation = false,
})

vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>", { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { silent = true, desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>BufferClose<CR>", { silent = true, desc = "Close Buffer" })
