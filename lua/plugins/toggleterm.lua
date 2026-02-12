return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			else
				return 20  -- float height
			end
		end,
		open_mapping = [[<leader>tt]],          -- your keybind
		hide_numbers = true,
		shade_terminals = true,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		direction = "float",                    -- float = popup window
		close_on_exit = true,
		shell = vim.o.shell,                    -- your default shell
		float_opts = {
			border = "curved",                  -- single, double, rounded, curved, shadow, none
			winblend = 0,                       -- transparency (0 = opaque, 100 = invisible)
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
}
