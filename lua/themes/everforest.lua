return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    -- Everforest color palette
    local colors = {
      bg0 = '#2b3339',
      bg1 = '#323c41',
      bg2 = '#3a454a',
      bg3 = '#445055',
      bg4 = '#4c555b',
      bg5 = '#53605c',
      bg_visual = '#503946',
      bg_red = '#4e3e43',
      bg_green = '#404d44',
      bg_blue = '#394f5a',
      bg_yellow = '#4a4940',
      fg = '#d3c6aa',
      red = '#e67e80',
      orange = '#e69875',
      yellow = '#dbbc7f',
      green = '#a7c080',
      blue = '#7fbbb3',
      aqua = '#83c092',
      purple = '#d699b6',
      grey0 = '#7a8478',
      grey1 = '#859289',
      grey2 = '#9da9a0',
    }

    -- Basic setup
    vim.g.everforest_background = 'hard'
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_enable_italic = 1
    vim.cmd[[colorscheme everforest]]

    -- You can now use these colors for your barbar highlighting
    vim.api.nvim_set_hl(0, 'BufferCurrent', {
      bg = colors.bg_green,  -- or try colors.bg_visual for more contrast
      fg = colors.fg
    })
  end
}
