return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.bufremove",
	},
	keys = {
		{ "<Tab>", ":BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "<S-Tab>", ":BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
	},
	opts = {
		options = {
			close_command = function(n)
				require("mini.bufremove").delete(n, false)
			end,
			middle_mouse_command = function(n)
				require("mini.bufremove").delete(n, false)
			end,
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
