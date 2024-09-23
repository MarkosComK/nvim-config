return {
  'voldikss/vim-floaterm',
  lazy = true, -- Load it on demand
  config = function()
    -- Optional: Customize Floaterm settings here
    vim.g.floaterm_border = 'rounded' -- Change border style if desired

    -- Key mapping to open Floaterm with Ctrl+t
    vim.api.nvim_set_keymap('n', '<C-t>', ':FloatermToggle<CR>', { noremap = true, silent = true })
  end,
}
