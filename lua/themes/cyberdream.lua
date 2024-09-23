return {
  'scottmckendry/cyberdream.nvim',
  lazy = false, -- Load it immediately
  priority = 1000, -- High priority to ensure it's loaded before other plugins
  config = function()
    -- Setup cyberdream with transparent background
    require('cyberdream').setup {
      transparent = true, -- Enable transparent background
      theme = {
        -- Other theme options here
        variant = 'default', -- You can leave it as default
        highlights = {
          -- Any additional highlight overrides you want
          Comment = { fg = nil, bg = nil, italic = false },
        },
        overrides = function(colors)
          return {
            Comment = { fg = colors.grey, bg = 'NONE', italic = false },
            -- Additional highlight overrides can go here
          }
        end,
      },
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },
    }

    -- Set the colorscheme
    vim.cmd [[colorscheme cyberdream]]
  end,
}
