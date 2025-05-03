return {
	setup = function()
		-- Verify if clangd is installed
		if vim.fn.executable('clangd') == 1 then
			-- Configure clangd
			require('lspconfig').clangd.setup({
				capabilities = _G.lsp_core.capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--suggest-missing-includes",
					"--clang-tidy",
					"--completion-style=detailed",
					"--fallback-style=llvm",
					"--enable-config", -- Use .clangd configuration file if present
					"--header-insertion=iwyu",
					"--pch-storage=memory"
				},
				filetypes = { "c", "cpp" },
				on_attach = function(client, bufnr)
					_G.lsp_core.on_attach(client, bufnr)
					
					-- Make sure diagnostics are on
					vim.diagnostic.enable(true)
					
					-- Force refresh diagnostics on save
					vim.api.nvim_create_autocmd("BufWritePost", {
						buffer = bufnr,
						callback = function()
							vim.diagnostic.reset()
							vim.lsp.buf.document_highlight()
							vim.lsp.diagnostic.show_line_diagnostics()
						end
					})
					
					-- Notify when clangd attaches
					vim.notify("clangd attached to buffer")
				end,
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true
				},
				flags = {
					debounce_text_changes = 150,
				},
				settings = {
					clangd = {
						-- Explicitly enable diagnostics
						diagnostics = {
							enable = true,
							onChange = true,
						}
					}
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
					
					-- Auto start clangd immediately
					vim.cmd("LspStart clangd")
					
					-- Ensure syntax is on for C files
					vim.cmd("syntax on")
					
					-- Set some helpful keymaps
					local opts = { noremap=true, silent=true, buffer=true }
					vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
				end
			})
		else
			vim.notify("clangd not found. Please install clangd for C/C++ support.", vim.log.levels.ERROR)
		end
	end
}
