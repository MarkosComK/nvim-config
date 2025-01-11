return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
	require("gruvbox").setup({
		terminal_colors = true, -- Enable terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			comments = true,
			operators = false,
			folds = true,
		},
		contrast = "hard", -- Can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})
	vim.cmd("colorscheme gruvbox")
	end
}
