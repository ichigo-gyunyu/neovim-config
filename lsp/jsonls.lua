return {
  cmd = { vim.fn.expand("$HOME/.local/share/nvim/mason/bin/vscode-json-language-server"), "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },
  init_options = { provideFormatter = true }
}
