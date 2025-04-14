-- Module to manage filetype-specific settings
local M = {}

-- C language settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c" },
  callback = function()
    -- Tab settings
    vim.opt_local.expandtab = false     -- Use actual tabs, not spaces
    vim.opt_local.tabstop = 4           -- Tab width of 4 spaces
    vim.opt_local.shiftwidth = 4        -- Indentation width of 4 spaces
    vim.opt_local.softtabstop = 0       -- Disable softtabstop to ensure real tabs
    
    -- Configure iskeyword for better completion
    vim.opt_local.iskeyword:append("_") -- Treat underscore as part of keywords
    
    -- LSP-specific settings for C
    if vim.fn.exists('*coc#config') == 1 then
      vim.fn['coc#config']('clangd.arguments', {
        "--header-insertion=never",
        "--completion-style=detailed"
      })
    end
    
    -- Custom key mappings for C files
    vim.api.nvim_buf_set_keymap(0, 'i', '<Tab>', 
      [[coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]], 
      { noremap = true, silent = true, expr = true })
      
    -- Show compilation errors in tmux pane if available
    vim.keymap.set("n", "<leader>cc", function()
      local file = vim.fn.expand("%:p")
      if vim.fn.executable('tmux') == 1 and vim.fn.environ()['TMUX'] ~= nil then
        vim.fn.system('tmux split-window -v -p 30')
        vim.fn.system(string.format('tmux send-keys "gcc -Wall -Wextra -Werror %s && ./a.out" C-m', file))
      else
        -- Fallback to terminal popup
        vim.cmd('below new | term gcc -Wall -Wextra -Werror ' .. file .. ' && ./a.out')
      end
    end, { buffer = true, desc = "Compile and run C file" })
  end
})

-- Python and Rust settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "rust" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Web development settings (JS, TS, HTML, CSS)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

-- Terminal settings
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end
})

return M
