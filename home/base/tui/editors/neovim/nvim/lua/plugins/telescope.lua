return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function() 
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "search help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "search keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "search select telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "search current word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "search with grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "search diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "search resume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "search recent files" })

		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "search buffers" })
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find in current buffer" })
		vim.keymap.set("n", "<leader>s/", function() 
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "grep open files",
			}) 
		end, { desc = "search in open files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "search in nvim config" })
	end,
}
