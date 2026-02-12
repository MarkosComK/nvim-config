return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = true,          -- Enables transparent background
      italic_comments = true,      -- optional: your preference
      hide_fillchars = false,      -- optional
      borderless_telescope = false, -- set true if you add telescope later
      terminal_colors = true,
    })

    vim.cmd.colorscheme("cyberdream")
  end,
}
