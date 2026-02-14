-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  -- Main completion engine
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",          -- optional: cmd-line completion
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets", -- CSS, HTML, JS, React, etc. snippets
      "onsails/lspkind.nvim",         -- nice icons in popup
    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Recommended: load friendly-snippets here (instead of in LuaSnip config)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",       -- show symbol + text
            maxwidth = 60,
            ellipsis_char = "...",
            menu = {
              nvim_lsp = "[LSP]",
              luasnip  = "[Snippet]",
              buffer   = "[Buffer]",
              path     = "[Path]",
            },
          }),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"]     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"]     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),          -- manual trigger
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- accept with Enter

          -- Super Tab-like behavior (very popular)
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip",  priority = 750  },
          { name = "path",     priority = 250  },
          { name = "buffer",   priority = 200, keyword_length = 3 },
        }),

        -- Optional: experimental features (try them)
        experimental = { ghost_text = false },
      })

      -- Cmdline completion (useful for :w, / search, etc.)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })
    end,
  },
}
