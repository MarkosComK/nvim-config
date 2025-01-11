return {
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
}
