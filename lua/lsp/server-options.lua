local M = {}

M.sumneko_lua = {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    -- Make the server aware of Neovim runtime files
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        },
    },
}

M.clangd = {
    cmd = { "clangd", "--background-index", "--header-insertion=iwyu" },
}

return M
