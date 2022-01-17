-- vimscript
local cmd = vim.cmd
cmd [[set whichwrap+=<,>,[,],h,l]]
cmd [[set iskeyword+=-]]
cmd [[ cnoremap w\!\! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]]

-- autocommands
cmd [[
    augroup _general
        autocmd!
        autocmd BufWinEnter * :set formatoptions-=cro
        autocmd BufWritePre * %s/\s\+$//e
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    augroup end

    augroup _views
        autocmd!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* silent loadview
    augroup end

    augroup _git
    autocmd!
        autocmd FileType gitcommit setlocal wrap
        autocmd FileType gitcommit setlocal spell
    augroup end

    augroup _markdown
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell
    augroup end

    augroup _latex
        autocmd!
        autocmd FileType tex setlocal wrap
        autocmd FileType tex setlocal spell
    augroup end
]]

-- vim options
local options = {
    backup = false,
    clipboard = "unnamedplus",
    completeopt = { "menuone", "noselect" },
    fileencoding = "utf-8",
    hlsearch = false,
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
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- globals
vim.g.netrw_winsize = 20
vim.g.tex_flavor = "latex"
