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
-- vim.cmd [[
--         augroup packer_user_config
--                 autocmd!
--                 autocmd BufWritePost plugins.lua source <afile> | PackerSync
--         augroup end
-- ]]

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
  use { "wbthomason/packer.nvim", commit = "" }
  use { "nvim-lua/plenary.nvim", commit = "" }
  use { "kyazdani42/nvim-web-devicons", commit = "" }
  use { "kyazdani42/nvim-tree.lua", commit = "" }
  use { "windwp/nvim-autopairs", commit = "" }
  use { "akinsho/bufferline.nvim", commit = "" }
  use { "nvim-lualine/lualine.nvim", commit = "" }
  use { "ahmedkhalf/project.nvim", commit = "" }
  use { "lewis6991/impatient.nvim", commit = "" }
  use { "folke/tokyonight.nvim", commit = "" }
  use { "hrsh7th/nvim-cmp", commit = "" }
  use { "hrsh7th/cmp-buffer", commit = "" }
  use { "hrsh7th/cmp-path", commit = "" }
  use { "hrsh7th/cmp-cmdline", commit = "" }
  use { "hrsh7th/cmp-nvim-lua", commit = "" }
  use { "hrsh7th/cmp-nvim-lsp", commit = "" }
  use { "saadparwaiz1/cmp_luasnip", commit = "" }
  use { "L3MON4D3/LuaSnip", commit = "" }
  use { "neovim/nvim-lspconfig", commit = "" }
  use { "williamboman/nvim-lsp-installer", commit = "" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "" }
  use { "ray-x/lsp_signature.nvim", commit = "" }
  use { "nvim-telescope/telescope.nvim", commit = "" }
  use { "nvim-treesitter/nvim-treesitter", commit = "" }
  use { "lewis6991/gitsigns.nvim", commit = "" }
  use { "numToStr/Comment.nvim", commit = "" }
  use { "vim-scripts/restore_view.vim", commit = "" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
