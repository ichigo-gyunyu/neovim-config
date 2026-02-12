return {
  cmd = { vim.fn.expand("vscode-json-language-server"), "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },
  init_options = { provideFormatter = true }
}
