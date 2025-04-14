-- C language specific configuration
return {
  -- This is a virtual/local plugin, no repository to download
  "nvim-c",
  name = "c-config",
  cond = false, -- This prevents lazy.nvim from trying to download it
  config = function()
    -- The configuration will be loaded via filetypes.lua instead
  end,
}
