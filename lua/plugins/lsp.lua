return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		-- Set up basic diagnostics for real-time error display
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Set up capabilities
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		
		-- Set up keybindings
		local on_attach = function(client, bufnr)
			local bufopts = { noremap=true, silent=true, buffer=bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
		end
		
		-- Setup basic cmp for autocompletion
		local cmp = require('cmp')
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
			},
		})

		-- Setup clangd directly (skip the language/c.lua step)
		require('lspconfig').clangd.setup({
			cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
			filetypes = { "c", "cpp" },
			on_attach = on_attach,
			capabilities = capabilities,
		})
		
		-- Force enable syntax highlighting
		vim.cmd("syntax on")
		vim.opt.termguicolors = true
	end
}
