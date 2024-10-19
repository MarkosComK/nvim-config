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
          NeoTreeGitUntracked = { fg = '#ff8700', bg = 'NONE', gui = 'NONE' }, -- Untracked files
          NeoTreeGitConflict = { fg = '#ff8700', bg = 'NONE', gui = 'bold,italic' }, -- Conflicted files
          NeoTreeGitModified = { fg = '#ffffff', bg = 'NONE' }, -- Modified files
          NeoTreeGitIgnored = { fg = '#757575', bg = 'NONE' }, -- Ignored files
          NeoTreeGitRenamed = { fg = '#ffffff', bg = 'NONE' }, -- Renamed files
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
    -- Change the color of line numbers
    vim.cmd.hi 'LineNr guifg=#7b8496' -- Set the color for normal line numbers
    vim.cmd.hi 'CursorLineNr guifg=#5ea1ff'
    vim.cmd.hi 'CursorLine guibg=#012140'
  end,
}
