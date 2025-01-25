return {
<<<<<<< HEAD
	"savq/melange-nvim",
	config = function()
		vim.cmd("colorscheme melange") -- Activate Melange colorscheme
		vim.opt.background = "dark"    -- Set dark background mode
		-- Enable transparency by clearing background colors
		vim.cmd([[
			hi Normal guibg=NONE ctermbg=NONE
			hi NormalNC guibg=NONE ctermbg=NONE
			hi LineNr guibg=NONE ctermbg=NONE
			hi SignColumn guibg=NONE ctermbg=NONE
			hi VertSplit guibg=NONE ctermbg=NONE
			hi StatusLine guibg=NONE ctermbg=NONE
			hi StatusLineNC guibg=NONE ctermbg=NONE
			hi EndOfBuffer guibg=NONE ctermbg=NONE
			" Transparency for Neotree sidebar
			hi NeotreeNormal guibg=NONE ctermbg=NONE
			hi NeotreeIndentMarker guibg=NONE ctermbg=NONE
			hi NeotreeTab guibg=NONE ctermbg=NONE
		]])
	end
=======
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		config = function()
		  vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
			  local hl_groups = {
				"Normal",
				"NormalNC",
				"NormalFloat",
				"SignColumn",
				"EndOfBuffer",
			  }
			  for _, name in ipairs(hl_groups) do
				vim.api.nvim_set_hl(0, name, { bg = "NONE" })
			  end
			end,
		  })
		  vim.cmd.colorscheme("melange")
		end,
	  },
>>>>>>> refs/remotes/origin/main
}
