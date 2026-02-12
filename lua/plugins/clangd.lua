return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim" },
	ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
	config = function()
		require("mason").setup()

		-- Define config (new native API, no deprecated calls)
		vim.lsp.config("clangd", {
			cmd = { "clangd", "--background-index", "--clang-tidy" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_markers = {
				".clangd",
				"compile_commands.json",
				"compile_flags.txt",
				".git",
			},
		})

		-- Enable the server
		vim.lsp.enable("clangd")

		-- Apply cmp capabilities AFTER attach to avoid race/changetracking assertion
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client or client.name ~= "clangd" then return end

				local cmp_cap = require("cmp_nvim_lsp").default_capabilities()
				client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities or {}, cmp_cap)
			end,
		})
	end,
}
