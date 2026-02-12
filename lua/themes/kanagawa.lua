return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",                    -- helps lazy identify it clearly
  lazy = false,                         -- must load immediately
  priority = 1000,                      -- highest priority so it loads before other UI plugins
  config = function()
    require("kanagawa").setup({
      -- Main settings
      theme = "dragon",                 -- the ink/dark variant you want
      transparent = true,               -- makes bg transparent (terminal bg shows through)
      dimInactive = false,              -- optional: don't dim inactive windows
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      functionStyle = {},

      -- Better contrast / readability with transparency
      colors = {
        palette = {
          -- optional slight tweaks (uncomment if needed)
          -- sumiInk0 = "#000000",     -- almost black background
        },
      },

      -- Make sidebars, floats, etc. transparent too
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat   = { bg = "none" },
          FloatBorder   = { bg = "none", fg = theme.ui.special },
          NormalSidebar = { bg = "none" },
          NeoTreeNormal = { bg = "none" },       -- future neo-tree support
          NeoTreeNormalNC = { bg = "none" },
          -- If you add barbar later:
          -- BufferTabpages = { bg = "none" },
        }
      end,

      -- Optional: compile for faster startup (recommended)
      compile = true,                       -- runs :KanagawaCompile once
    })

    -- Force the colorscheme after setup
    vim.cmd.colorscheme("kanagawa-dragon")  -- ← use full name for reliability
  end,
}
