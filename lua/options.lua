-- vimscript
local cmd = vim.cmd
cmd [[set whichwrap+=<,>,[,],h,l]]
cmd [[set iskeyword+=-]]
cmd [[ au BufWritePre * %s/\s\+$//e ]]
cmd [[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
cmd [[ cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]]

-- vim options
local options = {
    backup = false,
    clipboard = "unnamedplus",
    completeopt = { "menuone", "noselect" },
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
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
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- globals
vim.g.netrw_winsize = 20
