local terminal = require("toggleterm.terminal").Terminal
local lazygit = terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.keymap.set({ "n", "t" }, "q", "<cmd>close<CR>", { noremap = true, silent = true, buffer = term.bufnr })
  end,
  -- function to run on closing the terminal
  on_close = function(_)
    vim.cmd("startinsert!")
  end,
})

local lazygit_toggle = function()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>lg", lazygit_toggle, { noremap = true, silent = true, desc = "Toggle Lazygit" })
