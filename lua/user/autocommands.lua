-- prevent auto adding comments
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- set wrap and spell in md and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- remove extra whitespace before save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd "%s/s+$//e"
  end,
})

-- move cursor to previoulsy placed spot on opening a file
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    vim.cmd [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
  end,
})
