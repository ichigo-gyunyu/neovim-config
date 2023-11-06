return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = { enable = true },
	},
}
