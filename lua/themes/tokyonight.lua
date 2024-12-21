return {
  'folke/tokyonight.nvim', -- or any other theme plugin you prefer
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = 'night',
      transparent = true, -- Enable this for transparency
      colors = {
        -- Main editor colors matching your background
        bg = '#1a1b26',
        bg_dark = '#16161e',
        bg_float = '#16161e',
        
        -- Syntax colors inspired by your image
        blue = '#7aa2f7',    -- Matching the sky
        cyan = '#7dcfff',    -- Like the mountain snow
        green = '#2c6e31',   -- Like the pine trees
        teal = '#1abc9c',    -- For the meadows
        orange = '#946644',  -- Like the wooden houses
        yellow = '#e0af68',  -- For warm accents
        
        -- UI elements
        border = '#7aa2f7',
        selection = '#28344a',
        comment = '#565f89',
      },
      on_colors = function(colors)
        -- Additional color adjustments if needed
        colors.border = '#7aa2f7'
        colors.bg_visual = '#28344a'
      end,
    })
    
    -- Set the colorscheme
    vim.cmd[[colorscheme tokyonight]]
  end
}
