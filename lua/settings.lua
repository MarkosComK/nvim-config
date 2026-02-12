-- ============================================================================
-- settings.lua – all vim.opt / vim.g settings
-- ============================================================================

-- Leader keys – set them as early as possible
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local g   = vim.g

opt.termguicolors    = true
opt.number           = true
opt.relativenumber   = true
opt.list      = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- always show sign column (2 columns wide), no shifting
vim.opt.signcolumn = "yes"

-- Force OSC 52 clipboard (works over SSH + tmux + iTerm2)
vim.g.clipboard = {
  name = 'OSC52-copy-only',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  }, paste = {
  },
}

if vim.env.TMUX then
  vim.g.clipboard = {
    name = 'tmux-fallback',
    copy = {
      ['+'] = { 'tmux', 'load-buffer', '-' },
      ['*'] = { 'tmux', 'load-buffer', '-' },
    },
    paste = {
      ['+'] = { 'tmux', 'save-buffer', '-' },
      ['*'] = { 'tmux', 'save-buffer', '-' },
    },
    cache_enabled = 0,
  }
end

-- Still use system clipboard for explicit "+/* operations
vim.opt.clipboard = "unnamedplus"
