return {
  "romgrk/barbar.nvim",
  version = "^1.0.0",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<cmd>BufferNext<CR>", desc = "Next Buffer" },
    { "<S-Tab>", "<cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
    { "<leader>w", "<cmd>BufferClose<CR>", desc = "Close Buffer" },
  },
  init = function() vim.g.barbar_auto_setup = false end,
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    animation = false,
    sidebar_filetypes = {
      snacks_picker_list = true
    }
  },
}
