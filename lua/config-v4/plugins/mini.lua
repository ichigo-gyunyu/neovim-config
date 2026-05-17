require("mini.ai").setup()
require("mini.bracketed").setup()
require("mini.comment").setup()
-- require("mini.cursorword").setup()

local mini_files = require("mini.files")
mini_files.setup()
local minifiles_toggle = function()
  if not mini_files.close() then
    mini_files.open(vim.api.nvim_buf_get_name(0))
  end
end
vim.keymap.set("n", "<leader>e", minifiles_toggle, { desc = "Toggle MiniFiles" })

local mini_icons = require("mini.icons")
mini_icons.setup()
mini_icons.mock_nvim_web_devicons()

local mini_indentscope = require("mini.indentscope")
mini_indentscope.setup({
  draw = {
    delay = 10,
    animation = mini_indentscope.gen_animation.none(),
  },
})

require("mini.jump").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
