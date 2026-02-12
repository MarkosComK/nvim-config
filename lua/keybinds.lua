-- Save file
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = 'Save' })

-- Close current buffer (keeps window open if possible)
vim.keymap.set('n', '<leader>q', '<cmd>bdelete<CR>', { desc = 'Close buffer' })

-- Cycle through windows left/right with leader + h / l
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Go to right window' })
