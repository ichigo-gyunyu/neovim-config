local options = {
  backup = false,
  completeopt = { "menuone", "noinsert" },
  fileencoding = "utf-8",
  hlsearch = false,
  ignorecase = true,
  mouse = "a",
  pumheight = 20,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  hidden = true,
  termguicolors = true,
  timeoutlen = 500,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,
  relativenumber = true,
  cursorline = false,
  wrap = false,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  winborder = "rounded",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

require("vim._core.ui2").enable()
