return {
	'zigtools/zls',
	dependencies = {
		'neovim/nvim-lspconfig',
	},
	config = function()
		local lspconfig = require('lspconfig')
		
		-- Setup Zig Language Server
		lspconfig.zls.setup {
			on_attach = function(client, bufnr)
				-- Enable real-time diagnostics
				vim.diagnostic.config({
					virtual_text = true,
					signs = true,
					update_in_insert = true
				})
				
				-- Optional: Add some keymaps
				local opts = { noremap=true, silent=true }
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			end,
			capabilities = require('cmp_nvim_lsp').default_capabilities()
		}
	end
}
