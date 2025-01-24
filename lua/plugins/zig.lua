return {
	"ziglang/zig.vim",
	ft = "zig",
	config = function()
		-- Create floating terminal window
		local function create_float_term()
			-- Create buffer for terminal
			local buf = vim.api.nvim_create_buf(false, true)
			
			-- Get editor dimensions
			local width = math.floor(vim.o.columns * 0.8)
			local height = math.floor(vim.o.lines * 0.8)
			
			-- Calculate centered position
			local row = math.floor((vim.o.lines - height) / 2)
			local col = math.floor((vim.o.columns - width) / 2)
			
			-- Window options
			local opts = {
				relative = 'editor',
				width = width,
				height = height,
				row = row,
				col = col,
				anchor = 'NW',
				style = 'minimal',
				border = 'rounded'
			}
			
			-- Create window
			local win = vim.api.nvim_open_win(buf, true, opts)
			
			-- Set window options
			vim.api.nvim_win_set_option(win, 'winblend', 0)
			vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal')
			
			-- Return buffer for terminal creation
			return buf
		end

		-- Execute command in floating terminal
		local function exec_in_float_term(cmd)
			local buf = create_float_term()
			vim.fn.termopen(cmd, {
				on_exit = function()
					vim.cmd('nnoremap <buffer> q :q<CR>')
					vim.cmd('startinsert')
				end
			})
			-- Set mappings for terminal mode
			vim.api.nvim_buf_set_keymap(buf, 't', '<Esc>', [[<C-\><C-n>]], {noremap = true})
			vim.api.nvim_buf_set_keymap(buf, 't', 'q', [[<C-\><C-n>:q<CR>]], {noremap = true})
			vim.cmd('startinsert')
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "zig",
			callback = function()
				-- Set up visualization options
				vim.opt_local.list = true
				vim.opt_local.expandtab = true
				vim.opt_local.tabstop = 4
				vim.opt_local.shiftwidth = 4
				vim.opt_local.listchars = "tab:»»,space: ,leadmultispace:»   ,trail:·"
				
				-- Enhanced keymaps with floating terminal
				vim.keymap.set("n", "<leader>zr", function()
					local file = vim.fn.expand("%:p")
					exec_in_float_term(string.format('zig run %s', file))
				end, { buffer = true, desc = "Run Zig file" })

				vim.keymap.set("n", "<leader>zt", function()
					local current_dir = vim.fn.expand("%:p:h")
					exec_in_float_term(string.format('cd %s && zig build test', current_dir))
				end, { buffer = true, desc = "Run Zig tests" })

				vim.keymap.set("n", "<leader>zb", function()
					local current_dir = vim.fn.expand("%:p:h")
					exec_in_float_term(string.format('cd %s && zig build', current_dir))
				end, { buffer = true, desc = "Run Zig build" })

				-- Quick terminal access
				vim.keymap.set("n", "<leader>tt", function()
					exec_in_float_term(os.getenv("SHELL"))
				end, { buffer = true, desc = "Toggle terminal" })
			end
		})

		-- Subtle highlighting for whitespace
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3c3836" })
				vim.api.nvim_set_hl(0, "NonText", { fg = "#3c3836" })
			end
		})
	end,
}
