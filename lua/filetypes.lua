return {
	setup = function()
		-- C-specific settings
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp" },
			callback = function()
				-- Use tabs instead of spaces
				vim.opt_local.expandtab = false
				vim.opt_local.tabstop = 4
				vim.opt_local.shiftwidth = 4
				
				-- Start clangd explicitly
				vim.cmd("LspStart clangd")
			end
		})
	end
}
