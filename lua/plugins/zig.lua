return {
	"ziglang/zig.vim",
	ft = "zig",
	config = function()
		-- Tmux-aware keymaps for Zig
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "zig",
			callback = function()
				-- Run current Zig file
				vim.keymap.set("n", "<leader>zr", function()
					local file = vim.fn.expand("%:p")
					vim.fn.system('tmux split-window -v -p 60')
					vim.fn.system(string.format('tmux send-keys "zig run %s" C-m', file))
				end, { buffer = true, desc = "Run Zig file" })

				-- Run Zig tests
				vim.keymap.set("n", "<leader>zt", function()
					local current_dir = vim.fn.expand("%:p:h")
					vim.fn.system('tmux split-window -v -p 60')
					vim.fn.system(string.format('tmux send-keys "cd %s && zig build test" C-m', current_dir))
				end, { buffer = true, desc = "Run Zig tests" })

				-- Run Zig build
				vim.keymap.set("n", "<leader>zb", function()
					local current_dir = vim.fn.expand("%:p:h")
					vim.fn.system('tmux split-window -v -p 60')
					vim.fn.system(string.format('tmux send-keys "cd %s && zig build" C-m', current_dir))
				end, { buffer = true, desc = "Run Zig build" })

				-- Zig files tab and space visualization
				vim.api.nvim_create_autocmd("FileType", {
				  pattern = "zig",
				  callback = function()
					vim.opt_local.list = true
					vim.opt_local.expandtab = true
					vim.opt_local.tabstop = 4
					vim.opt_local.shiftwidth = 4
					vim.opt_local.listchars = "tab:»»,space: ,leadmultispace:»   "
				  end,
				})

				-- Quick terminal access (reusing your existing terminal toggle)
				vim.keymap.set("n", "<leader>tt", function()
					vim.fn.system('tmux split-window -v -p 60')
				end, { buffer = true, desc = "Toggle terminal" })
			end
		})
	end,
}
