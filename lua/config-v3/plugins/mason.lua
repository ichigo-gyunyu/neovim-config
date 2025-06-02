return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  version = "*",
  opts = {
    PATH = "prepend",
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
