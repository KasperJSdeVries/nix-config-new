return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.surround").setup()

		require("mini.statusline").setup({
			use_icons = vim.g.have_nerd_font,
			content = {
				active = function()
					local section_mode = function(args)
						if vim.fn.reg_recording() ~= "" then
							local mode_string = MiniStatusline.is_truncated(args.trunc_width) and "R@" or "Recording @"
							local mode = mode_string .. vim.fn.reg_recording()
							return mode, "MiniStatuslineModeOther"
						else
							return MiniStatusline.section_mode(args)
						end
					end

					local mode, mode_hl = section_mode({trunc_width = 120})
					local git           = MiniStatusline.section_git({trunc_width = 40})
					local diff          = MiniStatusline.section_diff({trunc_width = 75})
					local diagnostics   = MiniStatusline.section_diagnostics({trunc_width = 75})
					local lsp           = MiniStatusline.section_lsp({trunc_width = 75})
					local filename      = MiniStatusline.section_filename({trunc_width = 140})
					local fileinfo      = MiniStatusline.section_fileinfo({trunc_width = 120})
					local location      = "%2l:%-2v"
					local search        = MiniStatusline.section_searchcount({trunc_width = 75})

					return MiniStatusline.combine_groups({
						{ hl = mode_hl,                  strings = { mode } },
						{ hl = "MiniStatuslineDevinfo",  strings = { git, diff, diagnostics, lsp } },
						"%<",
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl,                  strings = { search, location } },
					})
				end,
			},
		})

		require("mini.starter").setup()
	end,
}
