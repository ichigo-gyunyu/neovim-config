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

    use 'wbthomason/packer.nvim' -- Packer manages itself
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "windwp/nvim-autopairs"
    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "folke/tokyonight.nvim"
    use "rose-pine/neovim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use "ray-x/lsp_signature.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "lewis6991/gitsigns.nvim"
    use "numToStr/Comment.nvim"
    use "vim-scripts/restore_view.vim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
