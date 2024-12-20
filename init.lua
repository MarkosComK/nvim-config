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
	"nvim-java/nvim-java",
	config = function()
		require("java").setup() -- Configuração básica
		require("lspconfig").jdtls.setup({}) -- Configuração do LSP
	end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,      -- Recommended
		-- ft = "markdown" -- If you decide to lazy-load anyway

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		}
	},
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
	{
	  "hrsh7th/nvim-cmp",
	  dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	  config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
		  snippet = {
			expand = function(args)
			  luasnip.lsp_expand(args.body)
			end,
		  },
		  mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm({
			  behavior = cmp.ConfirmBehavior.Replace,
			  select = true,
			}),
			['<Tab>'] = function(fallback)
			  if cmp.visible() then
				cmp.select_next_item()
			  elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			  else
				fallback()
			  end
			end,
		  },
		  sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
		  },
		})
	  end,
	},
	require 'plugins.java',
	require 'plugins.neo-tree',
	require 'plugins.coc',
	require 'plugins.lsp',
	require 'plugins.auto-pairs',
	require 'plugins.web-devicons',
	require 'plugins.42-header',
	require 'plugins.42-norminette',
	require 'plugins.barbar',
	require 'themes.cyberdream',
	-- Theme setup
})
