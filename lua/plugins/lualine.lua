return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",  -- loads after startup
	dependencies = {
		"nvim-tree/nvim-web-devicons",  -- icons (already have it?)
	},
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",  -- auto matches your colorscheme (cyberdream/tokyonight/etc.)
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },  -- powerline arrows for beauty
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,  -- one statusline for all windows (cleaner)
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},

			sections = {
				lualine_a = { "mode" },  -- mode indicator (NORMAL, INSERT...)
				lualine_b = { "branch", "diff", "diagnostics" },  -- git + errors/warnings
				lualine_c = { "filename" },  -- file name/path
				lualine_x = { "encoding", "fileformat", "filetype" },  -- right side info
				lualine_y = { "progress" },  -- % through file
				lualine_z = { "location" },  -- line:column
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},

			tabline = {},  -- if you want tabs here instead of barbar
			winbar = {},   -- per-window bar at top (optional)
			inactive_winbar = {},

			extensions = { "neo-tree" },  -- integrates with neo-tree if you have it
		})
	end,
}
