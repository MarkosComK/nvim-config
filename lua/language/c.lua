return {
	setup = function()
		-- Verify if clangd is installed
		if vim.fn.executable('clangd') == 1 then
			-- Notify that we found clangd
			vim.notify("Found clangd executable - setting up C/C++ LSP")
			
			-- Configure clangd
			require('lspconfig').clangd.setup({
				capabilities = _G.lsp_core.capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--suggest-missing-includes",
					"--clang-tidy",
					"--completion-style=detailed"
				},
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				on_attach = _G.lsp_core.on_attach,
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true
				},
				flags = {
					debounce_text_changes = 150,
				}
			})

			-- C-specific editor settings
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c", "cpp" },
				callback = function()
					-- Use tabs instead of spaces
					vim.opt_local.expandtab = false
					vim.opt_local.tabstop = 4
					vim.opt_local.shiftwidth = 4
					vim.opt_local.softtabstop = 0
					
					-- Manually trigger LSP attachment
					vim.cmd("LspStart clangd")
				end
			})
		else
			-- Notify user that clangd is not available
			vim.notify("clangd not found. Please install clangd for C/C++ support.", vim.log.levels.ERROR)
		end
	end
}
