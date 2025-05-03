return {
    -- Set up autocommands to load language configs
    setup = function()
        -- Load C configuration for C files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"c", "cpp", "h", "hpp"},
            callback = function()
                -- Make sure the language.c module exists
                local ok, c_config = pcall(require, "language.c")
                if ok then
                    c_config.setup()
                end
            end
        })
    end
}
