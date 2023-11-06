-- Move cursor to previoulsy placed spot on opening a file
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = "*",
	command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})
