vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  desc = "Move cursor to previoulsy placed spot on opening a file",
  pattern = "*",
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  desc = "Highlight when yanking text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "Bufenter" }, {
  desc = "Set line indent to 2 for certain file types",
  pattern = { "*.lua", "*.xml", "*.yml" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
