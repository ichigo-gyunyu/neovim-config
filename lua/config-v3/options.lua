local options = {
  backup = false,
  completeopt = { "menuone", "noselect" },
  fileencoding = "utf-8",
  hlsearch = false,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
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
  shiftwidth = 4,
  tabstop = 4,
  number = true,
  relativenumber = true,
  cursorline = false,
  wrap = false,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  winborder = "rounded"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
