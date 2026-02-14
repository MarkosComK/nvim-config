return {
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- use latest v2 release
    -- build = "make install_jsregexp",   -- only needed if you get jsregexp errors (rare)
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")

      -- Load friendly-snippets (VS Code style snippets for CSS, HTML, JS, TS, React…)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Optional: make jump-forward / jump-backward feel nicer
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(1) then ls.jump(1) end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.jumpable(-1) then ls.jump(-1) end
      end, { silent = true })

      -- Optional: unload choice nodes with <C-c> (useful when snippet has choices)
      vim.keymap.set({ "i", "s" }, "<C-c>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },

  -- Bridge between nvim-cmp and LuaSnip
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = { "L3MON4D3/LuaSnip" },
  },

}
