return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
        },
    },
    config = function()
        -- Basic Mason setup
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {}
        })

        -- Set up completion
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        
        -- This is crucial - set up completeopt correctly for nvim-cmp
        vim.opt.completeopt = {"menu", "menuone", "noselect"}
        
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
            mapping = {
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Space>'] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
            },
            -- IMPORTANT: Completely disable autoindent which is causing the error
            experimental = {
                ghost_text = false,
            },
        })

        -- Simple diagnostics configuration
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- Set diagnostic symbols
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- Core LSP on_attach with standard keybindings
        local on_attach = function(client, bufnr)
            -- Enable completion
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            
            -- Set keybindings
            local opts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
            
            -- Notify when LSP attaches
            vim.notify("LSP attached for " .. client.name)
        end

        -- Set up capabilities
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        
        -- Export the core on_attach and capabilities for language-specific configs
        _G.lsp_core = {
            on_attach = on_attach,
            capabilities = capabilities
        }
        
        -- Set up clangd directly
        require('lspconfig').clangd.setup({
            cmd = {"clangd", "--background-index", "--suggest-missing-includes"},
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "c", "cpp" },
        })
        
        -- Make sure clangd starts for C files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"c", "cpp"},
            callback = function()
                -- Force enable syntax highlighting
                vim.cmd("syntax on")
                vim.opt_local.termguicolors = true
                
                -- Start clangd
                vim.cmd("LspStart clangd")
            end
        })
        
        -- Force enable syntax highlighting for all filetypes
        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            pattern = "*",
            callback = function()
                vim.cmd("syntax on")
                vim.opt.termguicolors = true
            end
        })
    end
}
