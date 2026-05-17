local augroup = vim.api.nvim_create_augroup("config_v4", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  group = augroup,
  desc = "Move cursor to previoulsy placed spot on opening a file",
  pattern = "*",
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = augroup,
  desc = "Highlight when yanking text",
  callback = function()
    vim.highlight.on_yank()
  end,
})
