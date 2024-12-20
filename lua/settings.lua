vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Java Keymaps
local keymap = vim.keymap.set

-- LSP
keymap('n', 'gD', vim.lsp.buf.declaration, { buffer = true, desc = "Go to declaration" })
keymap('n', 'gd', vim.lsp.buf.definition, { buffer = true, desc = "Go to definition" })
keymap('n', 'K', vim.lsp.buf.hover, { buffer = true, desc = "Show hover information" })
keymap('n', 'gi', vim.lsp.buf.implementation, { buffer = true, desc = "Go to implementation" })
keymap('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = true, desc = "Show signature help" })
keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = true, desc = "Add workspace folder" })
keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = true, desc = "Remove workspace folder" })
keymap('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { buffer = true, desc = "List workspace folders" })
keymap('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = true, desc = "Go to type definition" })
keymap('n', '<leader>rn', vim.lsp.buf.rename, { buffer = true, desc = "Rename symbol" })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = true, desc = "Code actions" })
keymap('n', 'gr', vim.lsp.buf.references, { buffer = true, desc = "Show references" })

-- Java specific
keymap('n', '<leader>jo', function() require('java').organize_imports() end, { buffer = true, desc = "Organize imports" })
keymap('n', '<leader>jv', function() require('java').extract_variable() end, { buffer = true, desc = "Extract variable" })
keymap('n', '<leader>jc', function() require('java').extract_constant() end, { buffer = true, desc = "Extract constant" })
keymap('n', '<leader>jm', function() require('java').extract_method() end, { buffer = true, desc = "Extract method" })

-- Testing
keymap('n', '<leader>jt', function() require('java').test.file() end, { buffer = true, desc = "Run tests in file" })
keymap('n', '<leader>jn', function() require('java').test.nearest() end, { buffer = true, desc = "Run nearest test" })

-- Debugging
keymap('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { buffer = true, desc = "Toggle breakpoint" })
keymap('n', '<leader>dc', function() require('dap').continue() end, { buffer = true, desc = "Continue debugging" })
keymap('n', '<leader>ds', function() require('dap').step_over() end, { buffer = true, desc = "Step over" })
keymap('n', '<leader>di', function() require('dap').step_into() end, { buffer = true, desc = "Step into" })
keymap('n', '<leader>do', function() require('dap').step_out() end, { buffer = true, desc = "Step out" })

-- Mostrar números de linha e números relativos
vim.opt.number = true   -- Exibe números de linha
vim.opt.relativenumber = true  -- Exibe números relativos

-- Configurar tamanho de tabulação e recuo
vim.opt.tabstop = 4       -- Define tabulações para 4 espaços
vim.opt.shiftwidth = 4    -- Define o recuo automático para 4 espaços
vim.opt.expandtab = false -- keep tabulações
vim.g.have_nerd_font = true

-- Configurar navegação entre janelas com Ctrl + hjkl
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Janela à esquerda
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- Janela abaixo
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- Janela acima
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Janela à direita

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
