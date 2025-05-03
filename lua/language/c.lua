return {
    setup = function()
        -- Verify if clangd is installed
        if vim.fn.executable('clangd') == 1 then
            -- Notify that we found clangd
            vim.notify("Found clangd executable - setting up C/C++ LSP")
            
            -- Configure clangd
            require('lspconfig').clangd.setup({
                capabilities = _G.lsp_core.capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--suggest-missing-includes",
                    "--clang-tidy",
                    "--completion-style=detailed"
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                on_attach = _G.lsp_core.on_attach,
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true
                },
                flags = {
                    debounce_text_changes = 150,
                }
            })

            -- C-specific editor settings
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp" },
                callback = function()
                    -- Use tabs instead of spaces
                    vim.opt_local.expandtab = false
                    vim.opt_local.tabstop = 4
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.softtabstop = 0
                    
                    -- Force enable syntax highlighting for C files
                    vim.cmd("syntax on")
                    vim.opt_local.termguicolors = true
                    
                    -- Manually trigger LSP attachment
                    vim.cmd("LspStart clangd")
                    
                    -- C-specific keymaps can go here
                    local opts = { noremap=true, silent=true, buffer=true }
                    
                    -- Example: Add a mapping to find header/source file
                    vim.keymap.set('n', '<leader>ch', function()
                        -- Switch between .c and .h files
                        local file = vim.fn.expand('%')
                        local alt_file = file:match('%.c$') and file:gsub('%.c$', '.h') or file:gsub('%.h$', '.c')
                        if vim.fn.filereadable(alt_file) == 1 then
                            vim.cmd('edit ' .. alt_file)
                        else
                            vim.notify('Corresponding file not found: ' .. alt_file)
                        end
                    end, opts)
                end
            })
        else
            -- Notify user that clangd is not available
            vim.notify("clangd not found. Please install clangd for C/C++ support.", vim.log.levels.ERROR)
        end
    end
}
