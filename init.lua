vim.g.loaded_which_key = 1

require('settings')
-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins with lazy.nvim
require("lazy").setup({
    require 'plugins.42-header',
    require 'plugins.telescope',
    require 'plugins.lualine',
    require 'plugins.neo-tree',
    require 'plugins.auto-pairs',
    require 'plugins.web-devicons',
    require 'plugins.barbar',
    require 'plugins.lsp',
    -- Theme setup
    require 'themes.melange',
})
