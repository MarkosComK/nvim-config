return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(_) end, -- no snippets for now (you said you're happy with default showing)
			},

			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = function(fallback)
					fallback()  -- this is the key: fallback = insert tab character
				end,

				-- Default confirm with Enter (or change if you want)
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- Optional: keep Shift+J/K for menu navigation if you ever use it
				["<S-j>"] = cmp.mapping.select_next_item(),
				["<S-k>"] = cmp.mapping.select_prev_item(),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
			},
		})
	end,
}
