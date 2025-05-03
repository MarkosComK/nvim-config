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
}
