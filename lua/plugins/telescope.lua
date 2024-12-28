return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
	require('telescope').setup {
		defaults = {
			-- Adding transparency
			winblend = 10,  -- Value between 0-100, 0 is fully opaque, 100 is fully transparent
			-- Making the window a bit prettier
			layout_strategy = 'horizontal',
			layout_config = {
			  width = 0.8,
			  preview_width = 0.6,
			},
		},
	}
	-- Then the highlight settings
	vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "Normal" })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { link = "Normal" })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { link = "Normal" })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "CursorLine" })
	vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "Title" })
	vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "Title" })
	vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "Title" })
	-- Basic keymaps to get started
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find Text' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
  end,
}
