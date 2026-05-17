require("nvim-treesitter").setup()

local augroup = vim.api.nvim_create_augroup("config_v4_treesitter", { clear = true })
local filetypes = {}
local seen = {}

for _, parser_path in ipairs(vim.api.nvim_get_runtime_file("parser/*", true)) do
  local language = vim.fn.fnamemodify(parser_path, ":t:r")
  local ok, parser_filetypes = pcall(vim.treesitter.language.get_filetypes, language)

  if ok then
    for _, filetype in ipairs(parser_filetypes) do
      if not seen[filetype] then
        seen[filetype] = true
        table.insert(filetypes, filetype)
      end
    end
  end
end

if #filetypes > 0 then
  vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    desc = "Start Treesitter highlighting for installed parsers",
    pattern = filetypes,
    callback = function(args)
      vim.treesitter.start(args.buf)
      vim.bo[args.buf].syntax = ""
    end,
  })
end
