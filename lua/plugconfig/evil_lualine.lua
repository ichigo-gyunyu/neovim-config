local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local colors = {
    bg = "#262626",
    fg = "#bbc2cf",
    yellow = "#ff9e64",
    cyan = "#b4f9f8",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#bb9af7",
    blue = "#51afef",
    red = "#f7768e",
}

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    update_in_insert = false,
    always_visible = false,
    diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
    },
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = hide_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
        return " " .. str
    end,
}

local filetype = {
    "filetype",
    icons_enabled = true,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local filename = {
    "filename",
    color = { fg = colors.blue, gui = "bold" },
    cond = buffer_not_empty,
}

local filesize = {
    function()
        local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then
                return ""
            end
            local sufixes = { "b", "k", "m", "g" }
            local i = 1
            while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format("%.1f%s", size, sufixes[i])
        end
        local file = vim.fn.expand "%:p"
        if string.len(file) == 0 then
            return ""
        end
        return format_file_size(file)
    end,
    cond = buffer_not_empty,
    padding = 0,
}

local progress = {
    function()
        local total_lines = vim.fn.line "$"
        local location = "%l(%v)"
        return location .. "/" .. total_lines
    end,
}

local spaces = function()
    return "spaces " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lsp = {
    function()
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return "No Active LSP"
        end
        local active_clients = {}
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                active_clients[client.name] = true
            end
        end

        local c = ""
        for e in pairs(active_clients) do
            c = c .. " " .. e
        end
        return c
    end,
    icon = "",
    color = { fg = colors.magenta, gui = "bold" },
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename, filesize, diagnostics },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { lsp, diff, spaces, filetype },
        lualine_y = {},
        lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
