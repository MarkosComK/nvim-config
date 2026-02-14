return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",   -- lazy-load when you start typing
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        -- default options
        enable_close = true,          -- auto close tag on >
        enable_rename = true,         -- auto rename pair tag when changing opening tag
        enable_close_on_slash = true, -- auto close on </ (very convenient)
      },
      -- optional: filetypes (add more if needed)
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "jsx",
        "tsx",
        "xml",
        "php",
        "markdown",
        "glimmer",
        "handlebars",
        "hbs",
      },
    })
  end,
}
