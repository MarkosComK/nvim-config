vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--Saves using leader W
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file', silent = true })

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
vim.api.nvim_set_keymap('n', '<leader>q', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

--prevent swap files
vim.opt.swapfile = false

-- Python and Rust files tab configuration
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "rust" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Terminal popup configuration
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
        border = 'double',  -- nicer border style
        title = '  Terminal  ',  -- add a title
        title_pos = 'center'
    }
    
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Set window appearance
    vim.wo[win].winhl = 'Normal:TerminalNormal,FloatBorder:TerminalBorder'
    vim.wo[win].winblend = 0  -- no transparency
    
    -- Create highlight groups for the terminal
    vim.api.nvim_set_hl(0, 'TerminalNormal', {
        fg = '#a9b1d6'   -- light text color
    })
    vim.api.nvim_set_hl(0, 'TerminalBorder', {
        fg = '#ff9e64'   -- orange border color
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
