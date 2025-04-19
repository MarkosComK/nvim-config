return {
	setup = function()
	-- Tab settings for C files
	vim.opt_local.expandtab = false     -- Use actual tabs, not spaces
	vim.opt_local.tabstop = 4           -- Tab width of 4 spaces
	vim.opt_local.shiftwidth = 4        -- Indentation width of 4 spaces
	vim.opt_local.softtabstop = 0       -- Disable softtabstop to ensure real tabs

	-- Set up C language server with clangd
	local lspconfig = require('lspconfig')
	lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--header-insertion=never" },
			filetypes = { "c" },
			root_dir = function() return vim.loop.cwd() end,

		settings = {
			clangd = {
				-- Focus on functions and keywords, not words
				completion = {
					filterAndSort = true,
					-- Limit completion to symbols (not random words)
					include = { "completion.regex" }
				},
				-- Show compilation errors and warnings
				diagnostics = {
					onChange = true
				}
			}
		},

		on_attach = function(client, bufnr)
			-- Set keymap for completion
			vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-Space>', '<Cmd>lua vim.lsp.buf.completion()<CR>', { noremap = true, silent = true })
			
			-- Set keymaps for jumping to errors
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<Cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
			vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>E', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
			
			-- Show function signatures (hover)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
		end
	})

	-- Compile and run C file with errors highlighted
	vim.keymap.set("n", "<leader>cc", function()
		local file = vim.fn.expand("%:p")

		  -- Using tmux if available
		if vim.fn.executable('tmux') == 1 and vim.fn.environ()['TMUX'] ~= nil then
			vim.fn.system('tmux split-window -v -p 30')
			vim.fn.system(string.format('tmux send-keys "gcc -Wall -Wextra -Werror %s && ./a.out" C-m', file))
		else
			-- Fallback to built-in terminal
			vim.cmd('below new | term gcc -Wall -Wextra -Werror ' .. file .. ' && ./a.out')
		end
	end, { buffer = true, desc = "Compile and run C file" })
	end
}
