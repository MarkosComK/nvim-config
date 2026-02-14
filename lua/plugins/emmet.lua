return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet-ls#settings
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },
}
