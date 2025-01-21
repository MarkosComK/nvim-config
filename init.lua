vim.g.loaded_which_key = 1

require('settings')
-- Configuração do lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- versão estável
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carregar plugins com lazy.nvim
require("lazy").setup({
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
		  "nvim-lua/plenary.nvim",
		  "stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
			lsp = {
			  color = {
				enabled = true,
			  },
			  settings = {
				showTodos = true,
				completeFunctionCalls = true,
			  }
			}
			})
		end
	},
	{
		'echasnovski/mini.icons',
		event = 'VimEnter',  -- or any appropriate event
	},
	require 'plugins.telescope',
		  -- Outros plugins...
	require 'plugins.lualine',
	require 'plugins.java',
	require 'plugins.neo-tree',
	require 'plugins.coc',
	require 'plugins.lsp',
	require 'plugins.auto-pairs',
	require 'plugins.web-devicons',
	require 'plugins.42-header',
	require 'plugins.42-norminette',
	require 'plugins.barbar',
	require 'plugins.neoformat',
	require 'plugins.zig',
	require 'plugins.zig-lsp',
	-- Theme setup
	require 'themes.melange',
})
