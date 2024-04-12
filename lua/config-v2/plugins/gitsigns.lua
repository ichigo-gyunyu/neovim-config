return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  version = "*",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(bufnr)
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "<leader>h]", "<cmd>Gitsigns next_hunk<CR>", "Next Hunk")
      map("n", "<leader>h[", "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk")

      -- Actions
      map({ "n", "v" }, "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk")
      map({ "n", "v" }, "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk")
      map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", "Stage buffer")
      map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", "Reset buffer")
      map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo stage hunk")
      map("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>", "Preview hunk")
      map("n", "<leader>hb", '<cmd>lua require("gitsigns").blame_line{full=true}<CR>', "Blame line")
      map("n", "<leader>hB", "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle line blame")
      map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", "Diff this")
      map("n", "<leader>hD", '<cmd>lua require("gitsigns").diffthis("~")<CR>', "Diff this ~")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}
