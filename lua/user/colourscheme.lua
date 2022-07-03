-- folke/tokyonight
vim.g.tokyonight_style = "day"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

local colourscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colourscheme)
if not status_ok then
  vim.notify("colourscheme " .. colourscheme .. " not found!")
  return
end
