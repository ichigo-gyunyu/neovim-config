local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that Syncs plugins whenever plugins.lua is saved
vim.cmd [[
        augroup packer_user_config
                autocmd!
                autocmd BufWritePost plugins.lua source <afile> | PackerSync
        augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Floating window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use "folke/tokyonight.nvim"

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"

    use "L3MON4D3/LuaSnip" -- Snippet engine

    use "neovim/nvim-lspconfig" -- LSP

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
