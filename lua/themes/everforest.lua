return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = 'hard'
    vim.g.everforest_transparent_background = 1
    vim.g.everforest_enable_italic = 1
    vim.cmd[[colorscheme everforest]]
  end
}