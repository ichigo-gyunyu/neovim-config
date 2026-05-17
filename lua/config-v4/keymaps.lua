vim.g.mapleader = " "

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Resize window up" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Resize window down" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- JK
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent current line" })
vim.keymap.set("v", ">", ">gv", { desc = "Un-indent current line" })

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text up" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text down" })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text up" })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text down" })

-- Copy to system clipboard
vim.keymap.set("v", "<C-C>", '"+y', { desc = "Copy to system clipboard with Ctrl+Shift+c" })
vim.keymap.set("v", "<C-V>", '<ESC>"+p', { desc = "Paste from system clipboard with Ctrl+Shift+v" })

-- Escape in terminal mode
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Escape in terminal mode" })
