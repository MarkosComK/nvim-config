return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
            },
        },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                "zls",  -- Zig
                "ts_ls", -- TypeScript/JavaScript
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",
                "eslint",
                "stylelint_lsp"
            }
        })

        local cmp = require('cmp')
        local luasnip = require('luasnip')
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            },
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        
        -- Zig LSP setup
        require('lspconfig').zls.setup({
            capabilities = capabilities,
            settings = {
                zig = {
                    checkOnSave = true,
                    formationStyle = "file",
                    enableInlayHints = true,
                    semanticTokens = true,
                    showAllCompletion = true,
                }
            },
            on_attach = on_attach
        })

        -- Web development LSP setups
        local servers = {
			ts_ls = {
				init_options = {
					plugins = {
						{
							name = "@styled/typescript-styled-plugin",
							location = "node_modules/@styled/typescript-styled-plugin"
						}
					}
				}
			},
            html = {},
            cssls = {},
            tailwindcss = {},
            emmet_ls = {
                filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
            },
            eslint = {},
            stylelint_lsp = {}
        }

        for server, config in pairs(servers) do
            require('lspconfig')[server].setup(vim.tbl_extend('force', {
                capabilities = capabilities,
                on_attach = on_attach
            }, config))
        end

        -- LSP on_attach function
        local function on_attach(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>f', function() 
                vim.lsp.buf.format { async = true }
            end, bufopts)
        end

        -- Web files configuration for tabs
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css" },
            callback = function()
                vim.opt_local.expandtab = false
                vim.opt_local.tabstop = 2
                vim.opt_local.shiftwidth = 2
                vim.opt_local.softtabstop = 2
            end
        })
    end
}
