return {
	"ziglang/zig.vim",
	ft = "zig",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "zig",
			callback = function()
				-- Set up visualization with tabs and only trailing whitespaces
				vim.opt_local.list = true
				vim.opt_local.expandtab = true
				vim.opt_local.tabstop = 4
				vim.opt_local.shiftwidth = 4
				vim.opt_local.listchars = "tab:»»,space: ,leadmultispace:»   ,trail:·"

				-- Tmux-aware keymaps
				vim.keymap.set("n", "<leader>zr", function()
					local cwd = vim.fn.getcwd()
					vim.fn.system('tmux split-window -v -p 60')
					vim.fn.system(string.format('tmux send-keys "cd %s && zig build test" C-m', cwd))
				end, { buffer = true, desc = "Run Zig project from working directory" })

				vim.keymap.set("n", "<leader>zt", function()
					local current_dir = vim.fn.expand("%:p:h")
					vim.fn.system('tmux split-window -v -p 60')
					vim.fn.system(string.format('tmux send-keys "cd %s && zig build test" C-m', current_dir))
				end, { buffer = true, desc = "Run Zig tests" })

				vim.keymap.set("n", "<leader>zb", function()
					local current_dir = vim.fn.expand("%:p:h")
					vim.fn.system('tmux split-window -v -p 60')
					vim.fn.system(string.format('tmux send-keys "cd %s && zig build" C-m', current_dir))
				end, { buffer = true, desc = "Run Zig build" })

				vim.keymap.set("n", "<leader>tt", function()
					vim.fn.system('tmux split-window -v -p 60')
				end, { buffer = true, desc = "Toggle terminal" })
			end
		})

		-- Subtle highlighting for whitespace characters
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3c3836" })
				vim.api.nvim_set_hl(0, "NonText", { fg = "#3c3836" })
			end
		})
	end,
}
