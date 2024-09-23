-- plugins/auto-pairs.lua
return {
  'windwp/nvim-autopairs', -- Plugin name
  config = function()
    require('nvim-autopairs').setup {
      -- Configuration options
      disable_in_macro = false, -- Don't disable when recording a macro
      disable_in_visualblock = false, -- Don't disable in visual block mode
      disable_in_insert = false, -- Enable autopairs in insert mode
      map_cr = true, -- Map <CR> to insert a pair when pressing Enter
      map_complete = true, -- Enable autopairs completion
      auto_select = true, -- Automatically select the first pair
    }

    -- Optional: Setup for handling specific file types
    -- require('nvim-autopairs').add_rules(require('nvim-autopairs.rules').autopairs)

    -- You can also map any specific keys here if needed
  end,
}
