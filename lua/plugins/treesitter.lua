return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      -- keep whatever you already have + add these
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
      "json",
      "jsonc",
      -- optional but very nice
      "scss",
      "vue",      -- if you ever touch Vue
      "svelte",   -- if you ever touch Svelte
    },
    highlight = { enable = true },
    indent = { enable = true },
    -- optional: incremental selection & textobjects are very useful
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  },
}
