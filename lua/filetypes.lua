return {
	-- Set up autocommands to load language configs
	setup = function()
		-- Load C configuration for C files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "c",
			callback = function()
				require("language.c").setup()
			end
		})
		
		-- Terminal settings
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
				vim.opt_local.signcolumn = "no"
				vim.cmd("startinsert")
			end
		})
	end
}
