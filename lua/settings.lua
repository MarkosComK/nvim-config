vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Mostrar números de linha e números relativos
vim.opt.number = true   -- Exibe números de linha
vim.opt.relativenumber = true  -- Exibe números relativos

-- Configurar tamanho de tabulação e recuo
vim.opt.tabstop = 4       -- Define tabulações para 4 espaços
vim.opt.shiftwidth = 4    -- Define o recuo automático para 4 espaços
vim.opt.expandtab = false -- keep tabulações
vim.g.have_nerd_font = true

-- Configurar navegação entre janelas com Ctrl + hjkl
vim.keymap.set('n', '<Space>h', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<Space>j', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<Space>k', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<Space>l', '<C-w>l', { desc = 'Move to right window' })

-- Mapeamentos para navegação em modo de inserção
vim.api.nvim_set_keymap('i', '<C-h>', '<C-o><C-w>h', { noremap = true, silent = true }) -- Janela à esquerda
vim.api.nvim_set_keymap('i', '<C-j>', '<C-o><C-w>j', { noremap = true, silent = true }) -- Janela abaixo
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o><C-w>k', { noremap = true, silent = true }) -- Janela acima
vim.api.nvim_set_keymap('i', '<C-l>', '<C-o><C-w>l', { noremap = true, silent = true }) -- Janela à direita

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- reserve a column to compilation erros
vim.opt.signcolumn = "yes"

-- Navigation into buffers /barbar plugin
vim.api.nvim_set_keymap('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
-- Key mapping to close the current buffer/tab in barbar.nvim
vim.api.nvim_set_keymap('n', '<C-q>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

--prevent swap files
vim.opt.swapfile = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
