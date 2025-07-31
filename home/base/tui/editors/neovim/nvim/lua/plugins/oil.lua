return {
	"stevearc/oil.nvim",
	init = function()
		vim.keymap.set("n", "<leader>sv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
	opts = {
		columns = {
			"icon",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
