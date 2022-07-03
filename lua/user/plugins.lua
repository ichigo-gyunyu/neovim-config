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
  use { "wbthomason/packer.nvim", commit = "d268d2e083ca0abd95a57dfbcc5d5637a615e219" }
  use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }
  use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
  use { "kyazdani42/nvim-tree.lua", commit = "19dcacf06e26ca8cf2f160768044cc11db4e66fb" }
  use { "windwp/nvim-autopairs", commit = "4a95b3982be7397cd8e1370d1a09503f9b002dbf" }
  use { "akinsho/bufferline.nvim", commit = "aebb10c90a5c5fbef06d65dd898bb250ea8ccb41" }
  use { "nvim-lualine/lualine.nvim", commit = "5113cdb32f9d9588a2b56de6d1df6e33b06a554a" }
  use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
  use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  use { "hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe" }
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
  use { "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" }
  use { "hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
  use { "L3MON4D3/LuaSnip", commit = "295cc9e422060b3200234b42cbee6dde1dfee765" }
  use { "neovim/nvim-lspconfig", commit = "b9c375c385765ea42418f7994354bdecc1036765" }
  use { "williamboman/nvim-lsp-installer", commit = "d2c5d9cef4bf310ed3e14e2a8a0dd0f0fec13ac8" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "a2b7bf89663c78d58a5494efbb791819a24bb025" }
  use { "ray-x/lsp_signature.nvim", commit = "7fe077963c1880134f2ada752e52a8da74e829b7" }
  use { "nvim-telescope/telescope.nvim", commit = "4afd1be74a3fa633cfc324de8653206a5c143470" }
  use { "nvim-treesitter/nvim-treesitter", commit = "f75e27c2170ef4cc83cc9fa10a82c84ec82f5021" }
  use { "lewis6991/gitsigns.nvim", commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff" }
  use { "numToStr/Comment.nvim", commit = "4086630ce2aaf76b2652516ee3169f0b558f6be1" }
  use { "vim-scripts/restore_view.vim", commit = "8b933436e3ab8dec120841027183f0d72a4e2096" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
