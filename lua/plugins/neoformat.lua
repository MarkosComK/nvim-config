return {
	'sbdchd/neoformat',
	cmd = { 'Neoformat' }, -- This plugin is triggered via command
	keys = { '<leader>f' }, -- Bind key to trigger format
	config = function()
	-- Add custom configuration for Neoformat if needed
	vim.api.nvim_set_keymap('n', '<leader>f', ':Neoformat<CR>', { noremap = true, silent = true })
	end,
}
