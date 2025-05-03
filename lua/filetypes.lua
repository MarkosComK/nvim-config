return {
    -- Set up autocommands to load language configs
    setup = function()
        -- Load C configuration for C files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"c", "cpp", "h", "hpp"},
            callback = function()
                local ok, c_config = pcall(require, "language.c")
                if ok then
                    c_config.setup()
                else
                    vim.notify("C language configuration not found. Make sure language/c.lua exists.", vim.log.levels.WARN)
                end
            end
        })
    end
}
