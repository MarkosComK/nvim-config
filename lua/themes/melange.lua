return {
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
}
