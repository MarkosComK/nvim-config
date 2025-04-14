-- Core leader key settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Display settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.signcolumn = "yes"     -- Always show the signcolumn for errors/warnings
vim.opt.list = true            -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- File handling settings
vim.opt.swapfile = false       -- Prevent swap files

-- Global tab settings (will be overridden by filetype-specific settings)
vim.opt.tabstop = 4            -- Default tab width
vim.opt.shiftwidth = 4         -- Default indentation width
vim.opt.expandtab = false      -- Use real tabs by default

-- Window navigation with Space + hjkl
vim.keymap.set('n', '<Space>h', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<Space>j', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<Space>k', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<Space>l', '<C-w>l', { desc = 'Move to right window' })

-- Insert mode window navigation
vim.api.nvim_set_keymap('i', '<C-h>', '<C-o><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-o><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<C-o><C-w>l', { noremap = true, silent = true })

-- Buffer navigation (barbar.nvim)
vim.api.nvim_set_keymap('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

-- Quick save
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file', silent = true })

-- Open diagnostic quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NerdFont support
vim.g.have_nerd_font = true

-- Load filetype-specific settings
require('filetypes')
