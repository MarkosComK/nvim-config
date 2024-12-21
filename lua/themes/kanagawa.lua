return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      transparent = true,
      theme = "dragon", -- or "wave" for a darker variant
      background = {
        dark = "dragon",
        light = "lotus"
      },
    })
    vim.cmd[[colorscheme kanagawa]]
  end
}
