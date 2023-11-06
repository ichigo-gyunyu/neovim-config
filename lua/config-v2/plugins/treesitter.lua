return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = { enable = true },
	},
	main = "nvim-treesitter.configs",
}
