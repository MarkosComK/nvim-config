-- ============================================================================
-- init.lua – entry point
-- ============================================================================

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
	lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

-- Load core modules
require("settings")
require("keybinds")

-- Load plugins
require("lazy").setup({
	{ import = "plugins" },
	{ import = "themes" },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "c", "cpp" },
	callback = function(ev)
		local ok, mod = pcall(require, "language." .. ev.match)
		if ok and mod.setup then
			mod.setup(ev.buf)
		end
	end,
})
