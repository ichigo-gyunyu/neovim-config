require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
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
      {
        "encoding",
        show_bomb = true,
      },
      "fileformat",
      "filetype",
      {
        "lsp_status",
        ignore_lsp = { "copilot" },
      },
      "copilot",
    },
    lualine_y = {
      {
        "progress",
        fmt = function(str)
          return " " .. str
        end,
      },
    },
    lualine_z = {
      "location",
    },
  },
})
