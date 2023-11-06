return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.3",
	cmd = "Telescope",
	keys = function()
		local builtin = require("telescope.builtin")
		local builtin_with_args = function(builtin_fn, opts)
			return function()
				builtin_fn(opts)
			end
		end

		return {
			-- find
			{ "<leader>fb", builtin.buffers, desc = "Find Buffers" },
			{ "<leader>ff", builtin.find_files, desc = "Files" },
			{ "<leader>fr", builtin.oldfiles, desc = "Find Recents" },
			{
				"<leader>fR",
				builtin_with_args(builtin.oldfiles, { cwd = vim.loop.cwd() }),
				desc = "Find Recents (cwd)",
			},
			-- git
			{ "<leader>gc", builtin.git_commits, desc = "Git Commits" },
			{ "<leader>gs", builtin.git_status, desc = "Git Status" },
			-- search
			{ '<leader>s"', builtin.registers, desc = "Search Registers" },
			{ "<leader>sa", builtin.autocommands, desc = "Search Auto Commands" },
			{ "<leader>sb", builtin.current_buffer_fuzzy_find, desc = "Search Buffer" },
			{ "<leader>sc", builtin.command_history, desc = "Search Command History" },
			{ "<leader>sC", builtin.commands, desc = "Search Commands" },
			{
				"<leader>sd",
				builtin_with_args(builtin.diagnostics, { bufnr = 0 }),
				desc = "Search Document diagnostics",
			},
			{ "<leader>sD", builtin.diagnostics, desc = "Search Workspace diagnostics" },
			{ "<leader>sg", builtin.live_grep, desc = "Search Grep (root dir)" },
			{ "<leader>sh", builtin.help_tags, desc = "Search Help Pages" },
			{ "<leader>sH", builtin.highlights, desc = "Search Search Highlight Groups" },
			{ "<leader>sk", builtin.keymaps, desc = "Search Key Maps" },
			{ "<leader>sM", builtin.man_pages, desc = "Search Man Pages" },
			{ "<leader>sm", builtin.marks, desc = "Search Jump to Mark" },
			{ "<leader>so", builtin.vim_options, desc = "Search Options" },
			{ "<leader>ss", builtin.lsp_document_symbols, desc = "Search Symbols" },
			{ "<leader>sS", builtin.lsp_workspace_symbols, desc = "Search Symbols (workspace)" },
			{ "<leader>sw", builtin.grep_string, desc = "Search Word" },
		}
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
		},
	},
}
