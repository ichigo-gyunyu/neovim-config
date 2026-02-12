return {
  cmd = { vim.fn.expand("rust-analyzer") },
  filetypes = { "rust" },
  root_markers = { ".git", "Cargo.toml" },
  capabilities = {
    experimental = {
      serverStatusNotification = true,
      commands = {
        commands = {
          "rust-analyzer.showReferences",
          "rust-analyzer.runSingle",
          "rust-analyzer.debugSingle",
        },
      },
    },
  },
}
