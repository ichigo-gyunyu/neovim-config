return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "neotree" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",

          fmt = function(str)
            return " " .. str
          end,
        },
      },

      lualine_b = {
        {
          "branch",
          icon = "",
        },
        "diff",
        "diagnostics",
      },

      lualine_c = {
        "filename",
        "filesize",
      },

      lualine_x = {
        "filetype",
      },

      lualine_y = {
        "progress",
      },

      lualine_z = {
        "location",
      },
    },
  },
}
