return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "goto definition"})
				vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "goto references"})
				vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "goto implementation"})
				vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { desc = "type definitions"})
				vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbol, { desc = "document symbols"})
				vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "workspace symbols"})
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename"})
				vim.keymap.set({"n", "x"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action"})
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "goto declaration"})
				vim.keymap.set("n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, { desc = "toggle inlay hints"})

				local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorholdI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})
				vim.api.nvim_create_autocmd("LspDetach", {
					callback = function(detach_event)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = detach_event.buf })
					end,
				})
			end
		})

		vim.api.nvim_create_user_command("LspLogClear", function()
			local lsp_log_path = vim.fn.stdpath("state") .. "/lsp.log"
			print("Clearing logs at: " .. lsp_log_path)
			if io.close(io.open(lsp_log_path, "w+b")) == false then
				vim.notify("Clearing LSP Log failed!", vim.log.levels.WARN)
			end
		end, { nargs = 0 })

		vim.diagnostic.config({
			severity_sort = true,
			signs = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		local lspconfig = require("lspconfig")
		lspconfig.jsonls.setup({})
		lspconfig.jsonnet_ls.setup({})
		lspconfig.yamlls.setup({})
		lspconfig.taplo.setup({})
		lspconfig.terraformls.setup({})
		lspconfig.marksman.setup({})
		lspconfig.nil_ls.setup({})
		lspconfig.dockerls.setup({})
		lspconfig.cmake.setup({})
		lspconfig.sqls.setup({})

		lspconfig.clangd.setup({})
		lspconfig.gopls.setup({})
		lspconfig.rust_analyzer.setup({})
		lspconfig.pyright.setup({})
		lspconfig.ruff.setup({})
		lspconfig.zls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.bashls.setup({})

		lspconfig.html.setup({})
		lspconfig.cssls.setup({})
		lspconfig.prismals.setup({})
	end,
}
