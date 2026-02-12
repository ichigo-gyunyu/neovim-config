return {
  "williamboman/mason.nvim",
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
