return {
	setup = function(bufnr)
		-- Lua-specific options (use buffer-local)
		vim.bo[bufnr].expandtab   = false
		vim.bo[bufnr].tabstop     = 4
		vim.bo[bufnr].shiftwidth  = 4
		vim.bo[bufnr].softtabstop = 4

		-- Example: buffer-local keymaps (same leader key → different action per language)
		-- vim.keymap.set('n', '<leader>r', ':lua print("Running Lua file...")<CR>', {
		--   buffer = bufnr,
		--   desc   = 'Lua: Run current file',
		-- })
	end,
}
