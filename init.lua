-- Disable WhichKey to prevent conflicts
vim.g.loaded_which_key = 1

-- Load core settings
require('settings')

-- Setup lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- stable version
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins with lazy.nvim
require("lazy").setup({
  -- Flutter support
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
  
  -- Icons
  {
    'echasnovski/mini.icons',
    event = 'VimEnter',
  },
  
  -- Core plugins
  require('plugins.telescope'),
  require('plugins.lualine'),
  require('plugins.java'),
  require('plugins.neo-tree'),
  require('plugins.coc'),
  require('plugins.lsp'),
  require('plugins.auto-pairs'),
  require('plugins.web-devicons'),
  require('plugins.42-header'),
  require('plugins.42-norminette'),
  require('plugins.barbar'),
  require('plugins.neoformat'),
  require('plugins.zig'),
  require('plugins.zig-lsp'),
  require('plugins.c'),
  
  -- Theme setup - only one should be enabled
  require('themes.melange'),
  -- Other themes are commented out to avoid conflicts
  -- require('themes.cyberdream'),
  -- require('themes.everforest'),
  -- require('themes.kanagawa'),
  -- require('themes.miasma'),
  -- require('themes.nordic'),
  -- require('themes.tokyonight'),
})

-- Setup your floating terminal
vim.keymap.set('n', '<leader>tt', function()
  -- Get dimensions for centered floating window
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating window
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'double',
    title = '  Terminal  ',
    title_pos = 'center'
  }
  
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set window appearance
  vim.wo[win].winhl = 'Normal:TerminalNormal,FloatBorder:TerminalBorder'
  vim.wo[win].winblend = 0
  
  -- Create highlight groups for the terminal
  vim.api.nvim_set_hl(0, 'TerminalNormal', {
    fg = '#a9b1d6'
  })
  vim.api.nvim_set_hl(0, 'TerminalBorder', {
    fg = '#ff9e64'
  })

  -- Open terminal
  vim.fn.termopen(os.getenv('SHELL'))
  
  -- Set terminal mode mappings
  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { buffer = buf })
  vim.keymap.set('t', '<C-q>', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })
  
  -- Extra terminal settings
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.signcolumn = 'no'
  
  -- Start in insert mode
  vim.cmd('startinsert')
end, { noremap = true, silent = true })
